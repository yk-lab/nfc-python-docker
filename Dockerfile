FROM ubuntu:latest

ENV PATH /usr/local/bin:$PATH
ENV LANG C.UTF-8

RUN sed -i.bak -e "s%http://[^ ]\+%http://ftp.jaist.ac.jp/pub/Linux/ubuntu/%g" /etc/apt/sources.list && \
    apt update && apt upgrade -y && \
    apt install -y --no-install-recommends \
        dpkg-dev \
        tcl \
        tcl-dev \
        tk \
        tk-dev \
        usbutils \
        libnfc-dev \
        python \
        python-setuptools \
        python-pip \
    && apt autoremove -y && apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

RUN pip install -U --no-cache-dir pip && pip install -U --no-cache-dir \
    nfcpy
