FROM %%BASE_IMAGE%%

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

RUN apk update && apk add make gcc libc-dev wget ca-certificates tzdata \
    && cd /tmp \
        && wget http://www.cpan.org/src/5.0/perl-5.24.0.tar.gz \
        && tar xvzf perl-5.24.0.tar.gz \
    && cd perl-5.24.0 \
        && ./Configure -des && make && make install \
        && cd /tmp && rm -rf perl-5.24.0* \
    && cd /usr/local/bin \
        && wget https://cpanmin.us/ -O cpanm \
        && chmod +x cpanm
        && cpanm -V
#  cpanm  IO::Socket::SSL JSON::Any IO::Socket::INET6 Data::Validate::IP

RUN wget -O /usr/sbin/ddclient https://cdn.rawgit.com/ddclient/ddclient/7321959383e90e22f4932ee559fbc54367e1f882/ddclient &&\
 chmod +x /usr/sbin/ddclient
RUN apk add --no-cache perl perl-io-socket-ssl

COPY container /
RUN ln -s /etc/ddclient.conf /etc/ddclient/ddclient.conf

ENTRYPOINT ["/entrypoint.sh"]
