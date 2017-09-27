FROM homeassistant/amd64-base:latest

# Add env
ENV LANG='C.UTF-8'\
 LANGUAGE='C.UTF-8'\
 TERM='xterm'\
 GOPATH='/opt/go'

RUN apk upgrade --no-cache && \
apk add --no-cache -U --virtual .build-deps\
 build-base \
 git \
 go && \
apk add -U --no-cache \
 libressl \
 jq && \
go get -u github.com/quantumew/mustache-cli && \
cp $GOPATH/bin/* /usr/local/bin/ && \
rm -rf $GOPATH && \
apk del .build-deps

RUN apk upgrade --no-cache && \
    apk add --no-cache --virtual=build-deps \
      make \
      gcc \
      g++ \
      perl-dev \
      libxml2-dev \
      openssl-dev \
      wget \
      git \
      expat-dev && \
    apk add --no-cache --virtual=run-deps \
      ca-certificates \
      su-exec \
      openssl \
      ssmtp \
      mailx \
      perl && \
    wget https://cpanmin.us/ -O /usr/local/bin/cpanm && \
    chmod +x /usr/local/bin/cpanm && \
    /usr/local/bin/cpanm  IO::Socket::SSL JSON::Any IO::Socket::INET6 Data::Validate::IP && \
    git clone --depth 1 https://github.com/wimpunk/ddclient /opt/ddclient && \
    apk del --no-cache --purge \
      build-deps  && \
    rm -rf /opt/ddclient/.git \
           /usr/local/bin/cpanm \
           /root/.cpan \
           /tmp/* \
           /var/cache/apk/*  \
           /var/tmp/*

RUN wget -O /usr/sbin/ddclient https://cdn.rawgit.com/ddclient/ddclient/7321959383e90e22f4932ee559fbc54367e1f882/ddclient &&\
 chmod +x /usr/sbin/ddclient
RUN apk add --no-cache perl perl-io-socket-ssl

COPY container /
RUN ln -s /etc/ddclient.conf /etc/ddclient/ddclient.conf

ENTRYPOINT ["/entrypoint.sh"]
