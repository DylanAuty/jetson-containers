#---
# name: python-pyequilib
# alias: [equilib]
# depends: [build-essential, python]
# test: test.py
# notes: Container for pyequilib
#---
ARG BASE_IMAGE
FROM ${BASE_IMAGE}

RUN pip3 install pyequilib
RUN python3 -c 'import equilib; print(equilib.__version__)'
