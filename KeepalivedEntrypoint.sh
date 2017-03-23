#!/bin/sh

/link_conf.sh

keepalived -f /etc/keepalived/keepalived.conf --dont-fork --log-console

ps -ef | grep influxd | awk '{print $1}'|xargs kill -9
