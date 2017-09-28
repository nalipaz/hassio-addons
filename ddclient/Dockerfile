ARG BUILD_FROM
FROM $BUILD_FROM

# Add env
ENV LANG='C.UTF-8'\
 LANGUAGE='C.UTF-8'\
 TERM='xterm'\
 GOPATH='/opt/go'

# Setup base
RUN apk upgrade --no-cache && \
apk add --no-cache --virtual .build-deps\
 build-base\
 git\
 go && \
go get -u github.com/quantumew/mustache-cli && \
cp $GOPATH/bin/* /usr/local/bin/ && \
rm -rf $GOPATH && \
apk add --no-cache perl perl-io-socket-ssl && \
git clone --depth 1 https://github.com/wimpunk/ddclient /opt/ddclient && \
ln -s /opt/ddclient/ddclient /usr/local/bin/ && \
rm -rf /opt/ddclient/.git && \
apk del .build-deps

COPY container /

ENTRYPOINT ["/entrypoint.sh"]
