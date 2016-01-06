#!/bin/sh

# count child directories
# see: http://stackoverflow.com/a/6781464
# see: https://github.com/smebberson/docker-alpine/pull/13#issuecomment-161005924

# 0) count child directories
num_child=`ls -l /etc/consul-template/templates/ | grep -c ^d`

# 1) check if templates exist
if [ $num_child -gt 0 ]; then
  # 2) remove `down` to enable service
  if [ -e "/var/run/s6/services/consul-template/down" ]; then
    rm /var/run/s6/services/consul-template/down
  fi
  
  # 3) Execute `s6-svc -u` to notify supervisor that service should start
  s6-svc -u /var/run/s6/services/consul-template
  
  # 4) rm symlink
  rm /etc/consul/conf.d/_watch-node.conf
  
  # 5) reload consul configuration
  consul reload
fi
