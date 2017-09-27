ARG BUILD_FROM
FROM $BUILD_FROM

# Add env
ENV LANG='C.UTF-8'\
 LANGUAGE='C.UTF-8'\
 TERM='xterm'\
 GOPATH='/opt/go'

# Setup base
RUN apk upgrade --no-cache &&\
 apk add --no-cache perl perl-io-socket-ssl

COPY container /

ENTRYPOINT ["/entrypoint.sh"]
