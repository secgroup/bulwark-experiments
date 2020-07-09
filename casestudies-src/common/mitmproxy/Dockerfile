FROM mitmproxy/mitmproxy:5.0.1
USER root
RUN apk add libcap py3-zmq
RUN pip3 install pymongo
RUN setcap 'cap_net_bind_service=+ep' /usr/bin/python3.6
USER mitmproxy
ENTRYPOINT ["mitmweb", "--no-web-open-browser", "-k", "--web-iface", "0.0.0.0", "--web-port", "8081"]
