#!/usb/bin/env python3

import re

from mitmproxy import http, ctx
from mitmproxy.script import concurrent

import pymongo

import os
import json
import threading
import urllib.parse

################################################################################
## LIB

class PVThread(threading.Thread):
    pass

class Obj(object):
   def __init__(self, **kwargs):
     self._dict = kwargs
   def __getattr__(self, name):
     if name == '_dict':
         return super(Obj, self).__getattr__(name)
     return self._dict[name]
   def __setattr__(self, name, value):
     if name == '_dict':
         return super(Obj, self).__setattr__(name,value)
     self._dict[name] = value

CV = {}
https = "https"

################################################################################
## CONFIG

CONFIG = "monitor_auth_server.config"
with open(os.path.join(os.path.dirname(__file__), CONFIG), 'r') as f:
    exec(f.read())


################################################################################
## PROCESSES

def process_1(flow):
  try:
    # in(httpServerRequest, (cs__1000:Uri, hs:Headers, req:HttpRequest, corr:bitstring))
    with CV[flow]: CV[flow].wait()
    assert flow.request is not None
    cs__1000 = urllib.parse.urlparse(flow.request.pretty_url)
    hs = Obj(referer=flow.request.headers['referer'] if 'referer' in flow.request.headers else None, cookie=dict(flow.request.cookies))
    req = flow.request
    # let uri(=https(), =h, =oauthpath(), codereqparams(appidX, reduriX, stateX)) = cs__1000
    if not ((https) == ((cs__1000).scheme)): raise RuntimeError('Match failed!')
    if not ((h) == ((cs__1000).netloc)): raise RuntimeError('Match failed!')
    if not ((oauthpath) == ((cs__1000).path)): raise RuntimeError('Match failed!')
    appidX = codereqparams((cs__1000).query)[0]
    reduriX = codereqparams((cs__1000).query)[1]
    stateX = codereqparams((cs__1000).query)[2]
    # out(mC_1_out, (cs__1000, hs, req, corr))
    flow.request.url = urllib.parse.urlunparse(cs__1000)
    if (hs).referer: flow.request.headers['referer'] = (hs).referer
    flow.request.cookies = (hs).cookie.items()
    flow.request.method = (req).method
    if flow.request.method == 'POST':
        flow.request.raw_content = (req).raw_content
    with CV[flow]: CV[flow].notify_all()
    # in(mC_1_in, (cs__1101:Uri, resp:HttpResponse, cp:CookiePair, cs__1100:ReferrerPolicy, =corr))
    with CV[flow]: CV[flow].wait_for(lambda: flow.response is not None)
    cs__1101 = urllib.parse.urlparse(flow.request.pretty_url)
    resp = flow.response
    cp = dict(flow.response.cookies if flow.response.cookies else flow.request.cookies)
    cs__1100 = flow.response.headers['referrer-policy'] if 'referer-policy' in flow.response.headers else 'unsafe-url'
    # let =noReferrer() = cs__1100
    # let =uri(https(), h, oauthpath(), codereqparams(appidX, reduriX, stateX)) = cs__1101
    if not ((https) == ((cs__1101).scheme)): raise RuntimeError('Match failed!')
    if not ((h) == ((cs__1101).netloc)): raise RuntimeError('Match failed!')
    if not ((oauthpath) == ((cs__1101).path)): raise RuntimeError('Match failed!')
    if not ((appidX) == (codereqparams((cs__1101).query)[0])): raise RuntimeError('Match failed!')
    if not ((reduriX) == (codereqparams((cs__1101).query)[1])): raise RuntimeError('Match failed!')
    if not ((stateX) == (codereqparams((cs__1101).query)[2])): raise RuntimeError('Match failed!')
    # out(httpServerResponse, (cs__1101, resp, cp, cs__1100, corr))
    flow.response.status_code = (resp).status_code
    flow.response.text = (resp).text
    flow.response.headers['referrer-policy'] = cs__1100
    if flow in CV:
        with CV[flow]: CV[flow].notify_all()
  except:
    import traceback
    print(traceback.format_exc())


def process_2(flow):
  try:
    # in(httpServerRequest, (cs__1000:Uri, hs:Headers, req:HttpRequest, corr:bitstring))
    with CV[flow]: CV[flow].wait()
    assert flow.request is not None
    cs__1000 = urllib.parse.urlparse(flow.request.pretty_url)
    hs = Obj(referer=flow.request.headers['referer'] if 'referer' in flow.request.headers else None, cookie=dict(flow.request.cookies))
    req = flow.request
    # let uri(=https(), =h, =oauthpath(), codereqparams(=appid, uri(=https(), rh, rp, =nullParams()), state)) = cs__1000
    if not ((https) == ((cs__1000).scheme)): raise RuntimeError('Match failed!')
    if not ((h) == ((cs__1000).netloc)): raise RuntimeError('Match failed!')
    if not ((oauthpath) == ((cs__1000).path)): raise RuntimeError('Match failed!')
    if not ((appid) == (codereqparams((cs__1000).query)[0])): raise RuntimeError('Match failed!')
    if not ((https) == ((codereqparams((cs__1000).query)[1]).scheme)): raise RuntimeError('Match failed!')
    rh = (codereqparams((cs__1000).query)[1]).netloc
    rp = (codereqparams((cs__1000).query)[1]).path
    if not (("") == ((codereqparams((cs__1000).query)[1]).query)): raise RuntimeError('Match failed!')
    state = codereqparams((cs__1000).query)[2]
    # out(mC_1_out, (cs__1000, hs, req, corr))
    flow.request.url = urllib.parse.urlunparse(cs__1000)
    if (hs).referer: flow.request.headers['referer'] = (hs).referer
    flow.request.cookies = (hs).cookie.items()
    flow.request.method = (req).method
    if flow.request.method == 'POST':
        flow.request.raw_content = (req).raw_content
    with CV[flow]: CV[flow].notify_all()
    # in(mC_1_in, (cs__1102:Uri, cs__1100:HttpResponse, cp:CookiePair, cs__1101:ReferrerPolicy, =corr))
    with CV[flow]: CV[flow].wait_for(lambda: flow.response is not None)
    cs__1102 = urllib.parse.urlparse(flow.request.pretty_url)
    cs__1100 = flow.response
    cp = dict(flow.response.cookies if flow.response.cookies else flow.request.cookies)
    cs__1101 = flow.response.headers['referrer-policy'] if 'referer-policy' in flow.response.headers else 'unsafe-url'
    # let httpRedirect(uri(=https(), =rh, =rp, coderesparams(code, =state))) = cs__1100
    if not ((cs__1100).status_code >= 300 and (cs__1100).status_code <= 307): raise RuntimeError('Match failed!')
    if not ((https) == ((urllib.parse.urlparse((cs__1100).headers['location'])).scheme)): raise RuntimeError('Match failed!')
    if not ((rh) == ((urllib.parse.urlparse((cs__1100).headers['location'])).netloc)): raise RuntimeError('Match failed!')
    if not ((rp) == ((urllib.parse.urlparse((cs__1100).headers['location'])).path)): raise RuntimeError('Match failed!')
    code = coderesparams((urllib.parse.urlparse((cs__1100).headers['location'])).query)[0]
    if not ((state) == (coderesparams((urllib.parse.urlparse((cs__1100).headers['location'])).query)[1])): raise RuntimeError('Match failed!')
    # let =unsafeUrl() = cs__1101
    # let =uri(https(), h, oauthpath(), codereqparams(appid, uri(https(), rh, rp, nullParams()), state)) = cs__1102
    if not ((https) == ((cs__1102).scheme)): raise RuntimeError('Match failed!')
    if not ((h) == ((cs__1102).netloc)): raise RuntimeError('Match failed!')
    if not ((oauthpath) == ((cs__1102).path)): raise RuntimeError('Match failed!')
    if not ((appid) == (codereqparams((cs__1102).query)[0])): raise RuntimeError('Match failed!')
    if not ((https) == ((codereqparams((cs__1102).query)[1]).scheme)): raise RuntimeError('Match failed!')
    if not ((rh) == ((codereqparams((cs__1102).query)[1]).netloc)): raise RuntimeError('Match failed!')
    if not ((rp) == ((codereqparams((cs__1102).query)[1]).path)): raise RuntimeError('Match failed!')
    if not (("") == ((codereqparams((cs__1102).query)[1]).query)): raise RuntimeError('Match failed!')
    if not ((state) == (codereqparams((cs__1102).query)[2])): raise RuntimeError('Match failed!')
    # insert MIDPAuthCodes(h, appid, uri(https(), rh, rp, nullParams()), code)
    MIDPAuthCodes.insert({'col_1': h, 'col_2': appid, 'col_3': urllib.parse.urlparse(https+'://'+rh+rp), 'col_4': code})
    # out(httpServerResponse, (cs__1102, cs__1100, cp, cs__1101, corr))
    flow.response.status_code = (cs__1100).status_code
    flow.response.text = (cs__1100).text
    flow.response.headers['referrer-policy'] = cs__1101
    if flow in CV:
        with CV[flow]: CV[flow].notify_all()
  except:
    import traceback
    print(traceback.format_exc())


def process_3(flow):
  try:
    # in(httpServerRequest, (cs__1000:Uri, hs:Headers, cs__1001:HttpRequest, corr:bitstring))
    with CV[flow]: CV[flow].wait()
    assert flow.request is not None
    cs__1000 = urllib.parse.urlparse(flow.request.pretty_url)
    hs = Obj(referer=flow.request.headers['referer'] if 'referer' in flow.request.headers else None, cookie=dict(flow.request.cookies))
    cs__1001 = flow.request
    # let uri(=https(), =h, =tokenpath(), tokenreqparams(=appid, reduri, =appsecret, code)) = cs__1000
    if not ((https) == ((cs__1000).scheme)): raise RuntimeError('Match failed!')
    if not ((h) == ((cs__1000).netloc)): raise RuntimeError('Match failed!')
    if not ((tokenpath) == ((cs__1000).path)): raise RuntimeError('Match failed!')
    if not ((appid) == (tokenreqparams((cs__1000).query)[0])): raise RuntimeError('Match failed!')
    reduri = tokenreqparams((cs__1000).query)[1]
    if not ((appsecret) == (tokenreqparams((cs__1000).query)[2])): raise RuntimeError('Match failed!')
    code = tokenreqparams((cs__1000).query)[3]
    # let =httpGet() = cs__1001
    if not (("GET") == ((cs__1001).method)): raise RuntimeError('Match failed!')
    # get MIDPAuthCodes(=h, =appid, =reduri, =code) in
    __table_res = MIDPAuthCodes.find_one({'col_1': {'$eq': h}, 'col_2': {'$eq': appid}, 'col_3': {'$eq': reduri}, 'col_4': {'$eq': code}})
    if not (__table_res): raise RuntimeError('Match failed!')
    # out(mC_1_out, (cs__1000, hs, cs__1001, corr))
    flow.request.url = urllib.parse.urlunparse(cs__1000)
    if (hs).referer: flow.request.headers['referer'] = (hs).referer
    flow.request.cookies = (hs).cookie.items()
    flow.request.method = (cs__1001).method
    if flow.request.method == 'POST':
        flow.request.raw_content = (cs__1001).raw_content
    with CV[flow]: CV[flow].notify_all()
    # in(mC_1_in, (cs__1203:Uri, cs__1200:HttpResponse, cs__1201:CookiePair, cs__1202:ReferrerPolicy, =corr))
    with CV[flow]: CV[flow].wait_for(lambda: flow.response is not None)
    cs__1203 = urllib.parse.urlparse(flow.request.pretty_url)
    cs__1200 = flow.response
    cs__1201 = dict(flow.response.cookies if flow.response.cookies else flow.request.cookies)
    cs__1202 = flow.response.headers['referrer-policy'] if 'referer-policy' in flow.response.headers else 'unsafe-url'
    # let httpOk(tokenresjson(token)) = cs__1200
    if not ((cs__1200).status_code == 200): raise RuntimeError('Match failed!')
    token = tokenresjson((cs__1200).text)[0]
    # let =getCookie(hs) = cs__1201
    if not (((hs).cookie) == (cs__1201)): raise RuntimeError('Match failed!')
    # let =unsafeUrl() = cs__1202
    # let =uri(https(), h, tokenpath(), tokenreqparams(appid, reduri, appsecret, code)) = cs__1203
    if not ((https) == ((cs__1203).scheme)): raise RuntimeError('Match failed!')
    if not ((h) == ((cs__1203).netloc)): raise RuntimeError('Match failed!')
    if not ((tokenpath) == ((cs__1203).path)): raise RuntimeError('Match failed!')
    if not ((appid) == (tokenreqparams((cs__1203).query)[0])): raise RuntimeError('Match failed!')
    if not ((reduri) == (tokenreqparams((cs__1203).query)[1])): raise RuntimeError('Match failed!')
    if not ((appsecret) == (tokenreqparams((cs__1203).query)[2])): raise RuntimeError('Match failed!')
    if not ((code) == (tokenreqparams((cs__1203).query)[3])): raise RuntimeError('Match failed!')
    # out(httpServerResponse, (cs__1203, cs__1200, cs__1201, cs__1202, corr))
    flow.response.status_code = (cs__1200).status_code
    flow.response.text = (cs__1200).text
    flow.response.headers['referrer-policy'] = cs__1202
    if flow in CV:
        with CV[flow]: CV[flow].notify_all()
  except:
    import traceback
    print(traceback.format_exc())



HANDLERS = [process_1, process_2, process_3]
PATHS = [oauthpath, tokenpath]


################################################################################
## MITMPROXY ENTRYPOINT

def response(flow: http.HTTPFlow) -> None:
    if flow.request.path.split('?')[0] not in PATHS: return
    
    with CV[flow]:
        CV[flow].notify_all()
    with CV[flow]:
        if not CV[flow].wait(timeout=1.5):
            ctx.log.warn("<!> Wait timeout: response match error!")
            flow.response = http.make_error_response(500, "Wait timeout: response match error!")
        
    del CV[flow]

def request(flow: http.HTTPFlow) -> None:
    if flow.request.path.split('?')[0] not in PATHS: return
    
    CV[flow] = threading.Condition()
    ts = []
    for h in HANDLERS:
        t = PVThread(target=h, args=(flow,))
        t.daemon = True
        t.start()
    with CV[flow]: CV[flow].notify_all()
    with CV[flow]:
        if not CV[flow].wait(timeout=1.5):
            ctx.log.warn("<!> Wait timeout: request match error!")
            flow.response = http.make_error_response(500, "Wait timeout: request match error!")
