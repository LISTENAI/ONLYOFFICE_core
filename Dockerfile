# syntax=docker/dockerfile:1

FROM ubuntu:22.04
SHELL ["/bin/bash", "-c"]

RUN apt-get update && \
    apt-get install -y \
    autoconf \
    automake \
    build-essential \
    cmake \
    git \
    lbzip2 \
    libglib2.0-dev \
    libtool \
    make \
    pkg-config \
    python-is-python3 \
    qt6-base-dev \
    unzip \
    wget \
    xz-utils

WORKDIR /

ENV QT_SELECT=qt6
RUN qtchooser -install ${QT_SELECT} $(which qmake6)

RUN <<EOF
set -eux
git clone https://github.com/boostorg/boost.git
pushd /boost
git checkout boost-1.84.0
git submodule update --init --recursive
CXXFLAGS=-fms-extensions cmake '-DBOOST_EXCLUDE_LIBRARIES=context;cobalt;coroutine;fiber;log;thread;wave;type_erasure;serialization;locale;contract;graph'
make -j$(nproc)
make install
popd
rm -rf /boost
EOF

RUN <<EOF
set -eux
git clone https://github.com/unicode-org/icu.git -b maint/maint-58 --depth 1
pushd /icu/icu4c/source
sed -i 's/xlocale/locale/g' i18n/digitlst.cpp
./configure
make -j$(nproc)
make install
popd
rm -rf /icu
EOF

RUN <<EOF
set -eux
git clone https://github.com/openssl/openssl.git -b OpenSSL_1_1_1f --depth 1
pushd /openssl
./config enable-md2 no-shared no-asm
make -j$(nproc)
make install
popd
rm -rf /openssl
EOF

VOLUME [ "/core" ]
WORKDIR /core

COPY dobuild.sh /bin/dobuild.sh
