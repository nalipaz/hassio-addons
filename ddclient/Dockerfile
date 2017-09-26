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
RUN wget -O /usr/sbin/ddclient https://cdn.rawgit.com/ddclient/ddclient/7321959383e90e22f4932ee559fbc54367e1f882/ddclient
RUN apk add --no-cache perl perl-io-socket-ssl nano

COPY container /
RUN mustache-cli /data/options.json /templates/ddclient.mustache > /etc/ddclient.conf
RUN ln -s /etc/ddclient.conf /etc/ddclient/ddclient.conf

CMD ["/entrypoint.sh"]
ENTRYPOINT ["ddclient", "-foreground", "-verbose", "-daemon=30"]
