#!/usb/bin/env python3

# This script runs on the back channel and forwards requests and responses to the generated monitor `monitor_rp.py`.

import re

from mitmproxy import http, ctx
from mitmproxy.script import concurrent

import threading
import time
import urllib.parse

import pickle
import zmq

PORT = 65534
zmq_socket = None

def configure(updated):
    global zmq_socket
    try:
        ctx = zmq.Context()
        zmq_socket = ctx.socket(zmq.REQ)
        zmq_socket.bind("tcp://*:%s" % PORT)
    except:
        import traceback
        print(traceback.format_exc())


def request(flow: http.HTTPFlow) -> None:
    print ("REQ|", flow.request)
    data = dict(request=flow.request, response=flow.response)
    zmq_socket.send_multipart((b"REQ|", pickle.dumps(data)))
    _, action = zmq_socket.recv_multipart()
    if action == b'DROP':
        print("BACKCHAN killing request!")
        flow.kill()

def response(flow: http.HTTPFlow) -> None:
    print ("RES|", flow.response)
    data = dict(request=flow.request, response=flow.response)
    zmq_socket.send_multipart((b"RES|", pickle.dumps(data)))
    _, action = zmq_socket.recv_multipart()
    if action == b'DROP':
        print("BACKCHAN killing response!")
        flow.kill()
