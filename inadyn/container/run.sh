#!/usr/bin/env bash

mustache-cli /data/options.json /templates/inadyn.mustache > /usr/local/etc/inadyn.conf

/usr/local/sbin/inadyn --foreground
