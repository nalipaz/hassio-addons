ARG BUILD_FROM
FROM $BUILD_FROM

ENV INADYN_RELEASE https://github.com/troglobit/inadyn/releases/download/v2.1/inadyn-2.1.tar.xz
ENV LIBITE_RELEASE https://github.com/troglobit/libite/releases/download/v1.8.2/libite-1.8.2.tar.xz
ENV LIBCONFUSE_RELEASE https://github.com/martinh/libconfuse/releases/download/v3.2/confuse-3.2.tar.xz

ENV LANG='C.UTF-8'\
 LANGUAGE='C.UTF-8'\
 TERM='xterm'\
 GOPATH='/opt/go'

RUN apk --update add curl xz build-base libressl-dev ca-certificates && \
curl -Lo /tmp/src/libconfuse.tar.xz $LIBCONFUSE_RELEASE && \
tar --strip-components=1 -C /tmp/src/libconfuse -xJf /tmp/src/libconfuse.tar.xz && \
cd /tmp/src/libconfuse && \
./configure && \
make && \
make install && \
curl -Lo /tmp/src/inadyn.tar.xz $INADYN_RELEASE && \
tar --strip-components=1 -C /tmp/src/inadyn -xJf /tmp/src/inadyn.tar.xz && \
cd /tmp/src/inadyn && \
./configure --enable-openssl && \
make && \
make install && \
rm -rf /tmp/src && \
apk del xz build-base && \
rm -rf /var/cache/apk/*
RUN apk upgrade --no-cache && \
apk add --no-cache --virtual .build-deps\
 build-base\
 git\
 go && \
go get -u github.com/quantumew/mustache-cli && \
cp $GOPATH/bin/* /usr/local/bin/ && \
rm -rf $GOPATH && \
apk del .build-deps

COPY container /

ENTRYPOINT ["/entrypoint.sh"]
