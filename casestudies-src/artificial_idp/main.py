#!/usr/bin/env python3

import urllib.parse
import string
import random
import logging
import sys
import os
import argparse

import pymongo

from flask import Flask, render_template, request, session, redirect, abort, flash, url_for, jsonify


app = Flask(__name__)
app.secret_key = 'auth_serverSec'

mongo_host = os.environ.get('MONGO_HOST', 'localhost')

mongo_client = pymongo.MongoClient(host=mongo_host, connect=False)
db = mongo_client['auth_server']
DB_USERS = 'users'
DB_CLIENTS = 'clients'
DB_CODES = 'codes'
DB_TOKENS = 'tokens'


logger = logging.getLogger(__name__)
logging.basicConfig(stream=sys.stdout, level=logging.INFO,
                    format='[%(asctime)-15s] <%(name)s:%(levelname)s> %(message)s')


@app.route('/')
def index():
    return render_template('index.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    if 'username' in session:
        next_url = request.args.get('next', url_for('index'))
        return redirect(urllib.parse.unquote(next_url))

    if request.method == 'POST':
        if db[DB_USERS].find({
                'username': request.form['username'],
                'password': request.form['password']
        }).count() > 0:
            session['username'] = request.form['username']
            next_url = request.args.get('next', url_for('index'))
            return redirect(urllib.parse.unquote(next_url))

        flash('Invalid username or password!')
        return render_template('login.html')

    return render_template('login.html')


@app.route('/logout')
def logout():
    while 'username' in session:
        session.pop('username', None)
    while 'scope' in session:
        session.pop('scope', None)
    return redirect(url_for('index'))

@app.route('/oauth2/auth', methods=['GET', 'POST'])
def auth():
    response_type = request.args.get('response_type')
    redirect_uri = request.args.get('redirect_uri')
    scope = request.args.get('scope')
    client_id = request.args.get('client_id')
    state = request.args.get('state')

    assert response_type == 'code'
    assert redirect_uri
    assert scope
    assert client_id

    if request.method == 'POST':
        if request.form['action'] == 'ok':
            session['scope'] = scope
        if request.form['action'] == 'nope':
            return redirect(url_for('index'))

    client = db[DB_CLIENTS].find_one({'client_id': client_id})
    if not client:
        abort(401)
    
    if 'username' in session and 'scope' in session and session['scope'] == scope:
        code = ''.join(random.choice(string.ascii_letters+'/') for _ in range(128))

        # Save the code
        db[DB_CODES].insert({
            'client_id': client_id,
            'code': code,
            'redirect_uri':redirect_uri,
            'scope': scope,
            'username': session['username']
        })
        
        reduri = "{}?code={}".format(redirect_uri, code)
        if state:
            reduri += '&state={}'.format(state)
        return redirect(reduri, code=302)
        
    if not 'username' in session:
        return redirect('/login?next={}'.format(urllib.parse.quote_plus(request.full_path)))
    if not 'scope' in session:
        return render_template(
            'authorize.html',
            client_id=client_id,
            client_name=client['name'],
            scope=scope.split(" ")
        )


@app.route('/oauth2/token')
def token():
    redirect_uri = request.args.get('redirect_uri')
    code = request.args.get('code')
    client_id = request.args.get('client_id')
    client_secret = request.args.get('client_secret')

    assert redirect_uri
    assert code
    assert client_id
    assert client_secret

    client = db[DB_CLIENTS].find_one({
            'client_id': client_id,
            'client_secret': client_secret
    })
    issued_code = db[DB_CODES].find_one({
        'client_id': client_id,
        'code': code
    })
    
    if client and issued_code:
        
        token = ''.join(random.choice(string.ascii_letters+'/') for _ in range(128))

        # Delete code (code is single use)
        db[DB_CODES].delete_one({
            'client_id': client_id,
            'code': code
        })
        
        # Save the token
        db[DB_TOKENS].insert({
            'client_id': client_id,
            'token': token,
            'scope': issued_code['scope'],
            'username': issued_code['username']
        })
        
        return jsonify({'token': token})
    
    else:
        abort(401)
    

@app.route('/info')
def info():
    authorization = request.headers.get('Authorization')
    try:
        _, auth_token = authorization.split(" ")

        token_record = db[DB_TOKENS].find_one({
            'token': auth_token
        })
        if not token_record:
            raise RuntimeError()
        
        return jsonify({'email': token_record['username']})
        
    except:
        abort(401)
    
    
################################################################################

def main():
    parser = argparse.ArgumentParser('AUTH_SERVER')
    parser.add_argument('--host', default='0.0.0.0')
    parser.add_argument('--port', default=8080, type=int)
    parser.add_argument('--ssl', action='store_true', default=False)
    parser.add_argument('--debug', action='store_true', default=False)
    parser.add_argument('--init', action='store_true', default=False)
    args = parser.parse_args()

    if args.init:
        db.drop_collection(DB_USERS)
        db.drop_collection(DB_CLIENTS)
        db.drop_collection(DB_CODES)
        db.drop_collection(DB_TOKENS)
        db[DB_USERS].insert({"username" : "alberto.lupo@null.net", "password" : "qwerty" })
        db[DB_CLIENTS].insert({"client_id" : "67538654696", "name" : "App", "client_secret" : "Pq9LAGblNUnLswc3dtlXlccSXOe31S6I" })
        sys.exit(0)

    ssl_context = None
    if args.ssl:
        ssl_context='adhoc'

    app.run(host=args.host, port=args.port, threaded=True, debug=args.debug, ssl_context=ssl_context)

if __name__ == '__main__':
    main()
