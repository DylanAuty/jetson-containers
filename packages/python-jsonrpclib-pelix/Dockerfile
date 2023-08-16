#---
# name: python-jsonrpclib-pelix
# group: other
# depends: [build-essential, python]
# test: test.py
#---
ARG BASE_IMAGE
FROM ${BASE_IMAGE}

RUN pip3 install --verbose jsonrpclib-pelix

RUN pip3 show jsonrpclib-pelix && python3 -c 'import jsonrpclib; print(jsonrpclib.__version__)'
RUN pip3 install --upgrade --no-cache-dir --verbose jsonrpclib-pelix
RUN pip3 show jsonrpclib-pelix && python3 -c 'import jsonrpclib-pelix; print(jsonrpclib-pelix.__version__)'
