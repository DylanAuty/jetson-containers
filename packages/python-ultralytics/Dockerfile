#---
# name: python-ultralytics
# alias: [ultralytics]
# depends: [build-essential, python, torchvision]
# test: test.py
# notes: Container for ultralytics
#---
ARG BASE_IMAGE
FROM ${BASE_IMAGE}

RUN pip3 install --no-dependencies ultralytics
RUN pip3 uninstall numpy --yes
RUN pip3 install numpy==1.23.1 tqdm pyyaml pandas matplotlib scipy seaborn requests
RUN python3 -c 'import ultralytics; print(ultralytics.__version__)'
