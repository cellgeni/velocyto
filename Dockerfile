ARG ubuntu_version=18.04

FROM ubuntu:$ubuntu_version

RUN set -xe \
    && apt-get -y update \
    && apt-get -y install python3 \
    && apt-get -y install python3-dev \
    && apt-get -y install python3-pip \
    && apt-get -y install samtools

RUN pip3 install --upgrade pip

RUN pip3 install --upgrade --no-cache \
        numpy matplotlib ipython jupyter \
        pandas sympy nose numba scikit-learn \
        h5py click scipy pysam cython statsmodels

RUN pip3 install --upgrade --no-cache velocyto
