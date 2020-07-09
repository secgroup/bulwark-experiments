#!/usb/bin/env python3

import re

from mitmproxy import http, ctx
from mitmproxy.script import concurrent

import pymongo
import zmq

import os
import json
import pickle
import threading
import queue
import time
import urllib.parse

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

# Globals
CV = {}
PORT = 65534
zmq_socket = None
queue_req = None
queue_req_actions = None
queue_res = None
queue_res_actions = None
https = 'http'

################################################################################
## CONFIG

CONFIG = "monitor_paypal.config"
with open(os.path.join(os.path.dirname(__file__), CONFIG), 'r') as f:
    exec(f.read())

################################################################################
## PROCESSES

def process_1(flow):
  try:
    # in(httpServerRequest, (cs__1000:Uri, hs:Headers, cs__1001:HttpRequest, corr:bitstring))
    with CV[flow]: CV[flow].wait()
    assert flow.request is not None
    cs__1000 = urllib.parse.urlparse(flow.request.pretty_url)
    hs = Obj(referer=flow.request.headers['referer'] if 'referer' in flow.request.headers else None, cookie=dict(flow.request.cookies))
    cs__1001 = flow.request
    # let uri(=https(), =h, =checkoutpath(), =nullParams()) = cs__1000
    if not ((https) == ((cs__1000).scheme)): raise RuntimeError('Match failed!')
    if not ((h) == ((cs__1000).netloc)): raise RuntimeError('Match failed!')
    if not ((checkoutpath) == ((cs__1000).path)): raise RuntimeError('Match failed!')
    if not (("") == ((cs__1000).query)): raise RuntimeError('Match failed!')
    # out(mC_1_out, (cs__1000, hs, cs__1001, corr))
    flow.request.url = urllib.parse.urlunparse(cs__1000)
    if (hs).referer: flow.request.headers['referer'] = (hs).referer
    flow.request.cookies = (hs).cookie.items()
    flow.request.method = (cs__1001).method
    if flow.request.method == 'POST':
        flow.request.raw_content = (cs__1001).raw_content
    with CV[flow]: CV[flow].notify_all()
    # in(mC_1_in, (cs__1102:Uri, cs__1100:HttpResponse, cp:CookiePair, cs__1101:ReferrerPolicy, =corr))
    with CV[flow]: CV[flow].wait_for(lambda: flow.response is not None)
    cs__1102 = urllib.parse.urlparse(flow.request.pretty_url)
    cs__1100 = flow.response
    cp = dict(flow.response.cookies if flow.response.cookies else flow.request.cookies)
    cs__1101 = flow.response.headers['referrer-policy'] if 'referer-policy' in flow.response.headers else 'unsafe-url'
    # let httpOk(formGen(filledForm(webscrData(=integratorMerchantId, amt, inv, =uri(https(), h, ipnpath(), nullParams()), =uri(https(), h, callbackpath(), nullParams()))), =uri(https(), paypalcom, webscr(), nullParams()))) = cs__1100
    if not ((cs__1100).status_code == 200): raise RuntimeError('Match failed!')
    if not ((integratorMerchantId) == (webscrData(filledForm(formGen((cs__1100).text)[0])[0])[0])): raise RuntimeError('Match failed!')
    amt = webscrData(filledForm(formGen((cs__1100).text)[0])[0])[1]
    inv = webscrData(filledForm(formGen((cs__1100).text)[0])[0])[2]
    if not ((https) == ((webscrData(filledForm(formGen((cs__1100).text)[0])[0])[3]).scheme)): raise RuntimeError('Match failed!')
    #if not ((h) == ((webscrData(filledForm(formGen((cs__1100).text)[0])[0])[3]).netloc)): raise RuntimeError('Match failed!')
    if not ((ipnpath) == ((webscrData(filledForm(formGen((cs__1100).text)[0])[0])[3]).path)): raise RuntimeError('Match failed!')
    if not (("") == ((webscrData(filledForm(formGen((cs__1100).text)[0])[0])[3]).query)): raise RuntimeError('Match failed!')
    if not ((https) == ((webscrData(filledForm(formGen((cs__1100).text)[0])[0])[4]).scheme)): raise RuntimeError('Match failed!')
    #if not ((h) == ((webscrData(filledForm(formGen((cs__1100).text)[0])[0])[4]).netloc)): raise RuntimeError('Match failed!')
    if not ((callbackpath) == ((webscrData(filledForm(formGen((cs__1100).text)[0])[0])[4]).path)): raise RuntimeError('Match failed!')
    if not (("") == ((webscrData(filledForm(formGen((cs__1100).text)[0])[0])[4]).query)): raise RuntimeError('Match failed!')
    if not (("https") == ((formGen((cs__1100).text)[1]).scheme)): raise RuntimeError('Match failed!')
    if not ((paypalcom) == ((formGen((cs__1100).text)[1]).netloc)): raise RuntimeError('Match failed!')
    if not ((webscr) == ((formGen((cs__1100).text)[1]).path)): raise RuntimeError('Match failed!')
    if not (("") == ((formGen((cs__1100).text)[1]).query)): raise RuntimeError('Match failed!')
    # let =unsafeUrl() = cs__1101
    # let =uri(https(), h, checkoutpath(), nullParams()) = cs__1102
    if not ((https) == ((cs__1102).scheme)): raise RuntimeError('Match failed!')
    if not ((h) == ((cs__1102).netloc)): raise RuntimeError('Match failed!')
    if not ((checkoutpath) == ((cs__1102).path)): raise RuntimeError('Match failed!')
    if not (("") == ((cs__1102).query)): raise RuntimeError('Match failed!')
    # insert MTransactions(inv, amt)
    MTransactions.insert({'col_1': inv, 'col_2': amt})
    # out(httpServerResponse, (cs__1102, cs__1100, cp, cs__1101, corr))
    flow.response.status_code = (cs__1100).status_code
    flow.response.text = (cs__1100).text
    flow.response.headers['referrer-policy'] = cs__1101
    if flow in CV:
        with CV[flow]: CV[flow].notify_all()
  except:
    import traceback
    print(traceback.format_exc())


def process_2(flow):
  try:
    # in(httpServerRequest, (cs__1000:Uri, hs:Headers, cs__1001:HttpRequest, corr:bitstring))
    with CV[flow]: CV[flow].wait()
    assert flow.request is not None
    cs__1000 = urllib.parse.urlparse(flow.request.pretty_url)
    hs = Obj(referer=flow.request.headers['referer'] if 'referer' in flow.request.headers else None, cookie=dict(flow.request.cookies))
    cs__1001 = flow.request
    # let uri(=https(), =h, =callbackpath(), =nullParams()) = cs__1000
    if not ((https) == ((cs__1000).scheme)): raise RuntimeError('Match failed!')
    if not ((h) == ((cs__1000).netloc)): raise RuntimeError('Match failed!')
    if not ((callbackpath) == ((cs__1000).path)): raise RuntimeError('Match failed!')
    if not (("") == ((cs__1000).query)): raise RuntimeError('Match failed!')
    # let =httpGet() = cs__1001
    if not (("GET") == ((cs__1001).method)): raise RuntimeError('Match failed!')
    # out(mC_1_out, (cs__1000, hs, cs__1001, corr))
    flow.request.url = urllib.parse.urlunparse(cs__1000)
    if (hs).referer: flow.request.headers['referer'] = (hs).referer
    flow.request.cookies = (hs).cookie.items()
    flow.request.method = (cs__1001).method
    if flow.request.method == 'POST':
        flow.request.raw_content = (cs__1001).raw_content
    with CV[flow]: CV[flow].notify_all()
    # in(mC_1_in, (cs__1103:Uri, cs__1101:HttpResponse, cs__1100:CookiePair, cs__1102:ReferrerPolicy, =corr))
    with CV[flow]: CV[flow].wait_for(lambda: flow.response is not None)
    cs__1103 = urllib.parse.urlparse(flow.request.pretty_url)
    cs__1101 = flow.response
    cs__1100 = dict(flow.response.cookies if flow.response.cookies else flow.request.cookies)
    cs__1102 = flow.response.headers['referrer-policy'] if 'referer-policy' in flow.response.headers else 'unsafe-url'
    # let =getCookie(hs) = cs__1100
    # let =httpOk(success()) = cs__1101
    # let =unsafeUrl() = cs__1102
    # let =uri(https(), h, callbackpath(), nullParams()) = cs__1103
    if not ((https) == ((cs__1103).scheme)): raise RuntimeError('Match failed!')
    if not ((h) == ((cs__1103).netloc)): raise RuntimeError('Match failed!')
    if not ((callbackpath) == ((cs__1103).path)): raise RuntimeError('Match failed!')
    if not (("") == ((cs__1103).query)): raise RuntimeError('Match failed!')
    # out(httpServerResponse, (cs__1103, cs__1101, cs__1100, cs__1102, corr))
    flow.response.status_code = (cs__1101).status_code
    flow.response.text = (cs__1101).text
    flow.response.headers['referrer-policy'] = cs__1102
    if flow in CV:
        with CV[flow]: CV[flow].notify_all()
  except:
    import traceback
    print(traceback.format_exc())


def process_3(flow):
  try:
    # in(httpServerRequest, (cs__1001:Uri, hs:Headers, cs__1000:HttpRequest, corr:bitstring))
    with CV[flow]: CV[flow].wait()
    assert flow.request is not None
    cs__1001 = urllib.parse.urlparse(flow.request.pretty_url)
    hs = Obj(referer=flow.request.headers['referer'] if 'referer' in flow.request.headers else None, cookie=dict(flow.request.cookies))
    cs__1000 = flow.request
    # let httpPost(ipnData(merchantId, amt, inv, payerId, verisign)) = cs__1000
    merchantId = ipnData(httpPost(cs__1000)[0])[0]
    amt = ipnData(httpPost(cs__1000)[0])[1]
    inv = ipnData(httpPost(cs__1000)[0])[2]
    payerId = ipnData(httpPost(cs__1000)[0])[3]
    verisign = ipnData(httpPost(cs__1000)[0])[4]
    # let uri(=https(), =h, =ipnpath(), =nullParams()) = cs__1001
    if not ((https) == ((cs__1001).scheme)): raise RuntimeError('Match failed!')
    if not ((h) == ((cs__1001).netloc)): raise RuntimeError('Match failed!')
    if not ((ipnpath) == ((cs__1001).path)): raise RuntimeError('Match failed!')
    if not (("") == ((cs__1001).query)): raise RuntimeError('Match failed!')
    # if merchantId = integratorMerchantId then
    if (merchantId) == (integratorMerchantId):
        # get MTransactions(=inv, =amt) in
        __table_res = MTransactions.find_one({'col_1': {'$eq': inv}, 'col_2': {'$eq': amt}})
        if not (__table_res): raise RuntimeError('Match failed!')
        # out(mC_1_out, (cs__1001, hs, cs__1000, corr))
        flow.request.url = urllib.parse.urlunparse(cs__1001)
        if (hs).referer: flow.request.headers['referer'] = (hs).referer
        flow.request.cookies = (hs).cookie.items()
        flow.request.method = (cs__1000).method
        if flow.request.method == 'POST':
            flow.request.raw_content = (cs__1000).raw_content
        with CV[flow]: CV[flow].notify_all()
        # in(mC_2_in, (cs__1202:Uri, cs__1200:Headers, cs__1201:HttpRequest, ncorr:bitstring))
        __backchan_req = queue_req.get(timeout=1)
        cs__1202 = urllib.parse.urlparse(__backchan_req['request'].pretty_url)
        cs__1200 = Obj(referer=__backchan_req['request'].headers['referer'] if 'referer' in __backchan_req['request'].headers else None, cookie=dict(__backchan_req['request'].cookies))
        cs__1201 = __backchan_req['request']
        # let headers(noneUri, =nullCookiePair(), =notajax()) = cs__1200
        noneUri = (cs__1200).referer
        if not (((cs__1200).cookie == {})): raise RuntimeError('Match failed!')
        # let =httpPost(ipnData(merchantId, amt, inv, payerId, verisign)) = cs__1201
        if not ((merchantId) == (ipnData(httpPost(cs__1201)[0])[0])): raise RuntimeError('Match failed!')
        if not ((amt) == (ipnData(httpPost(cs__1201)[0])[1])): raise RuntimeError('Match failed!')
        if not ((inv) == (ipnData(httpPost(cs__1201)[0])[2])): raise RuntimeError('Match failed!')
        if not ((payerId) == (ipnData(httpPost(cs__1201)[0])[3])): raise RuntimeError('Match failed!')
        if not ((verisign) == (ipnData(httpPost(cs__1201)[0])[4])): raise RuntimeError('Match failed!')
        # let =uri(https(), paypalcom, webscr(), nullParams()) = cs__1202
        if not (("https") == ((cs__1202).scheme)): raise RuntimeError('Match failed!')
        if not ((paypalcom) == ((cs__1202).netloc)): raise RuntimeError('Match failed!')
        if not ((webscr) == ((cs__1202).path)): raise RuntimeError('Match failed!')
        if not (("") == ((cs__1202).query)): raise RuntimeError('Match failed!')
        # out(httpServerRequest, (cs__1202, cs__1200, cs__1201, ncorr))
        queue_req_actions.put(b'ok')
        # in(httpServerResponse, (cs__1301:Uri, cs__1300:HttpResponse, cpXX:CookiePair, rpXX:ReferrerPolicy, =ncorr))
        __backchan_res = queue_res.get(timeout=1)
        cs__1301 = urllib.parse.urlparse(__backchan_res['request'].pretty_url)
        cs__1300 = __backchan_res['response']
        cpXX = __backchan_res['response'].cookies
        rpXX = __backchan_res['response'].headers['referrer-policy'] if 'referer-policy' in __backchan_res['response'].headers else 'unsafe-url'
        # let httpOk(=verified()) = cs__1300
        if not ((cs__1300).status_code == 200): raise RuntimeError('Match failed!')
        if not ((verified) == ((cs__1300).text)): raise RuntimeError('Match failed!')
        # let =uri(https(), paypalcom, webscr(), nullParams()) = cs__1301
        if not (("https") == ((cs__1301).scheme)): raise RuntimeError('Match failed!')
        if not ((paypalcom) == ((cs__1301).netloc)): raise RuntimeError('Match failed!')
        if not ((webscr) == ((cs__1301).path)): raise RuntimeError('Match failed!')
        if not (("") == ((cs__1301).query)): raise RuntimeError('Match failed!')
        # out(mC_2_out, (cs__1301, cs__1300, cpXX, rpXX, ncorr))
        queue_res_actions.put(b'ok')
        # in(mC_1_in, (cs__1403:Uri, cs__1401:HttpResponse, cs__1400:CookiePair, cs__1402:ReferrerPolicy, =corr))
        with CV[flow]: CV[flow].wait_for(lambda: flow.response is not None)
        cs__1403 = urllib.parse.urlparse(flow.request.pretty_url)
        cs__1401 = flow.response
        cs__1400 = dict(flow.response.cookies if flow.response.cookies else flow.request.cookies)
        cs__1402 = flow.response.headers['referrer-policy'] if 'referer-policy' in flow.response.headers else 'unsafe-url'
        # let =getCookie(hs) = cs__1400
        # let =httpOk(empty()) = cs__1401
        if not ((cs__1401).status_code == 200): raise RuntimeError('Match failed!')
        # let =unsafeUrl() = cs__1402
        # let =uri(https(), h, ipnpath(), nullParams()) = cs__1403
        if not ((https) == ((cs__1403).scheme)): raise RuntimeError('Match failed!')
        if not ((h) == ((cs__1403).netloc)): raise RuntimeError('Match failed!')
        if not ((ipnpath) == ((cs__1403).path)): raise RuntimeError('Match failed!')
        if not (("") == ((cs__1403).query)): raise RuntimeError('Match failed!')
        # out(httpServerResponse, (cs__1403, cs__1401, cs__1400, cs__1402, corr))
        flow.response.status_code = (cs__1401).status_code
        flow.response.text = (cs__1401).text
        flow.response.headers['referrer-policy'] = cs__1402
        if flow in CV:
            with CV[flow]: CV[flow].notify_all()
    else:
      raise RuntimeError('if Failed!')
  except:
      import traceback
      print(traceback.format_exc())



HANDLERS = [process_1, process_2, process_3]
PATHS = [checkoutpath, callbackpath, ipnpath]
BACKCHAN_PATHS = [webscr]



################################################################################
## MITMPROXY ENTRYPOINT

def zmq_worker(zmq_socket, queue_req, queue_req_actions, queue_res, queue_res_actions):
    while True:
        try:
            msgtype, data = zmq_socket.recv_multipart()
            flow = pickle.loads(data)
            print("==> NEW DATA on back channel:")
            print(flow)

            if urllib.parse.urlparse(flow['request'].pretty_url).path in BACKCHAN_PATHS:
                if msgtype == b'REQ|':
                    queue_req.put(flow)
                    try:
                        act = queue_req_actions.get(timeout=0.5)
                        zmq_socket.send_multipart((msgtype, act))
                    except queue.Empty:
                        zmq_socket.send_multipart((msgtype, b'DROP'))
                    
                if msgtype == b'RES|':
                    queue_res.put(flow)
                    try:
                        act = queue_res_actions.get(timeout=0.5)
                        print(act)
                        zmq_socket.send_multipart((msgtype, act))
                    except queue.Empty:
                        zmq_socket.send_multipart((msgtype, b'DROP'))
            else:
                zmq_socket.send_multipart((msgtype, b'ok'))

        except zmq.ZMQError as e:
            # the queue is closed
            print("<!> zmq error!! {}".format(e))
            return
        except pickle.PickleError as e:
            # there something wrong with the data
            print("<!> pickle error!! {}".format(e))
        except Exception as e:
            import traceback
            print(traceback.format_exc())


def setup_backchannels():
    global zmq_socket
    global queue_req
    global queue_req_actions
    global queue_res
    global queue_res_actions
    
    try:
        time.sleep(3)
        print("Connecting to the backchannel proxy...")
        ctx = zmq.Context()
        zmq_socket = ctx.socket(zmq.REP)
        zmq_socket.connect("tcp://mitmback:%s" % PORT)
        print (zmq_socket)

        print("Making queues...")
        queue_req = queue.Queue()
        queue_req_actions = queue.Queue()
        queue_res = queue.Queue()
        queue_res_actions = queue.Queue()
        zmq_t = threading.Thread(
            target=zmq_worker,
            args=[zmq_socket, queue_req, queue_req_actions, queue_res, queue_res_actions],
            daemon=True)
        zmq_t.start()
    except:
        import traceback
        print(traceback.format_exc())

def response(flow: http.HTTPFlow) -> None:
    if flow.request.path.split('?')[0] not in PATHS: return
    
    with CV[flow]:
        CV[flow].notify_all()
    with CV[flow]:
        if not CV[flow].wait(timeout=3):
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
        if not CV[flow].wait(timeout=3):
            ctx.log.warn("<!> Wait timeout: request match error!")
            flow.response = http.make_error_response(500, "Wait timeout: request match error!")
