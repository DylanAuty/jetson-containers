#---
# name: python-jsonrpclib-pelix
# alis: [jsonrpclib, jsonrpclib-pelix, python-jsonrpclib]
# depends: [build-essential, python]
# test: test.py
# notes: Container for jsonrpc server running in python (jsonrpclib-pelix)
#---
ARG BASE_IMAGE
FROM ${BASE_IMAGE}

RUN pip3 install --no-dependencies ultralytics
RUN pip3 uninstall numpy
RUN pip3 install numpy==1.23.1 tqdm pyyaml pandas matplotlib scipy seaborn requests
RUN python3 -c 'import ultralytics; print(ultralytics.__version__)'
