FROM ubuntu:14.04
MAINTAINER Rafael G. Martins <rafael@rafaelmartins.eng.br>

RUN apt-get update && apt-get install -y \
    pkg-config gettext zlib1g-dev libffi-dev \
    autoconf automake build-essential libtool libxml2-utils \
    libfcgi-dev shared-mime-info libglib2.0-dev git peg \
    --no-install-recommends && apt-get clean

RUN git clone https://github.com/balde/balde.git ~/balde

RUN cd ~/balde && \
    ./autogen.sh && \
    ./configure --prefix=/usr && \
    make && \
    make install
