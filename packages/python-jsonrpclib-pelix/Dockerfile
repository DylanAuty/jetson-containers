#---
# name: python-jsonrpclib-pelix
# alias: [jsonrpclib, jsonrpclib-pelix, python-jsonrpclib]
# depends: [build-essential, python]
# test: test.py
# notes: Container for jsonrpc server running in python (jsonrpclib-pelix)
#---
ARG BASE_IMAGE
FROM ${BASE_IMAGE}

RUN pip3 install --verbose jsonrpclib-pelix

RUN pip3 show jsonrpclib-pelix && python3 -c 'import jsonrpclib; print(jsonrpclib.__version__)'
RUN pip3 install --upgrade --no-cache-dir --verbose jsonrpclib-pelix
RUN pip3 show jsonrpclib-pelix && python3 -c 'import jsonrpclib; print(jsonrpclib.__version__)'
