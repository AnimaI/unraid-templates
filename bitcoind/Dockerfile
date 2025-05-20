FROM alpine AS build

RUN apk --no-cache add \
        bash \
        boost-dev \
        coreutils \
        cmake \
        curl \
        git \
        libevent-dev \
        libffi-dev \
        openssl-dev \
        zeromq-dev \
        ccache \
        g++ \
        gcc \
        make \
    && apk --no-cache add --update alpine-sdk build-base

ARG VERSION

RUN git clone --depth 1 https://github.com/bitcoin/bitcoin.git --branch v$VERSION --single-branch

WORKDIR /bitcoin

RUN cd /bitcoin/depends; make NO_QT=1 -j"$(($(nproc)+1))"

RUN mkdir build
WORKDIR /bitcoin/build

RUN export CONFIG_SITE=/bitcoin/depends/$(/bitcoin/depends/config.guess)/share/config.site && \
    cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_DAEMON=ON \
    -DBUILD_GUI=OFF \
    -DBUILD_CLI=ON \
    -DBUILD_TESTS=OFF \
    -DBUILD_TX=ON \
    -DBUILD_UTIL=ON \
    -DENABLE_WALLET=OFF \
    -DENABLE_HARDENING=ON \
    -DREDUCE_EXPORTS=ON \
    -DWITH_CCACHE=ON \
    -DWITH_ZMQ=ON \
    -DBUILD_BENCH=OFF \
    -DINSTALL_MAN=OFF \
    -DCMAKE_CXX_FLAGS="-O2 -pipe -fdata-sections -ffunction-sections" \
    -DCMAKE_C_FLAGS="-O2 -pipe -fdata-sections -ffunction-sections" \
    -DCMAKE_EXE_LINKER_FLAGS="-Wl,--gc-sections -Wl,--strip-all"

RUN make -j"$(($(nproc)+1))"

RUN make install DESTDIR=/tmp/bitcoin-install

FROM alpine:latest

RUN apk --no-cache add \
        libevent \
        zeromq \
        boost-system \
        boost-filesystem \
        boost-thread

COPY --from=build /tmp/bitcoin-install/usr/local/ /usr/local/

RUN mkdir -p /.bitcoin
COPY --from=build /bitcoin/share/examples/bitcoin.conf /.bitcoin/bitcoin.conf
COPY start-bitcoind.sh /start-bitcoind.sh
RUN chmod +x /start-bitcoind.sh

VOLUME ["/.bitcoin"]

EXPOSE 8332 8333 18332 18333 18444

ENTRYPOINT ["/start-bitcoind.sh"]
