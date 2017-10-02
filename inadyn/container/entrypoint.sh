#!/usr/bin/env bash

if [ ${SHIPPABLE} ]; then
  mkdir /data/
  touch /data/options.json
  echo ${TEST_OPTIONS} > /data/options.json
fi

mustache-cli /data/options.json /templates/inadyn.mustache > /usr/local/etc/inadyn.conf
cat /usr/local/etc/inadyn.conf

/usr/local/sbin/inadyn --foreground
