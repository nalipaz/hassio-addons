ARG BUILD_FROM
FROM ${BUILD_FROM}

ENV inadyn_release https://github.com/troglobit/inadyn/releases/download/v2.2/inadyn-2.2.tar.xz
ENV libite_release https://github.com/troglobit/libite/releases/download/v1.9.2/libite-1.9.2.tar.xz
ENV libconfuse_release https://github.com/martinh/libconfuse/releases/download/v3.2.1/confuse-3.2.1.tar.xz

ENV LANG='C.UTF-8'\
 TERM='xterm-256color'\
 GOPATH='/opt/go'

RUN apk --no-cache add curl xz build-base libressl-dev ca-certificates

RUN for app in libite libconfuse inadyn; do\
  mkdir -p /tmp/src/${app} &&\
  release_url="${app}_release" &&\
  if [ ${app} == "inadyn" ]; then config_options='--enable-openssl'; else config_options=''; fi &&\
  curl -Lo /tmp/src/${app}.tar.xz "${!release_url}" &&\
  tar --strip-components=1 -C /tmp/src/${app} -xJf /tmp/src/${app}.tar.xz &&\
  cd /tmp/src/${app} &&\
  ./configure ${config_options} &&\
  make &&\
  make install;\
done;

RUN apk upgrade --no-cache &&\
 apk add --no-cache --virtual .build-deps\
 build-base\
 git\
 go &&\
 go get -u github.com/quantumew/mustache-cli &&\
 cp $GOPATH/bin/* /usr/local/bin/ && \
 rm -rf $GOPATH /var/cache/apk/* /tmp/src &&\
 apk del .build-deps xz build-base

COPY container /

CMD ["/run.sh"]
