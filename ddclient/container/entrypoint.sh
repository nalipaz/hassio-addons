#!/usr/bin/env bash

mustache-cli /data/options.json /templates/ddclient.mustache > /etc/ddclient.conf

ddclient -foreground -verbose -daemon=30
