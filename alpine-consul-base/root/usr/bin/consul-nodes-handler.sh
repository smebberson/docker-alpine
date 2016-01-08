#!/bin/sh

# count child directories
# see: http://stackoverflow.com/a/6781464
# see: https://github.com/smebberson/docker-alpine/pull/13#issuecomment-161005924

# count child directories
num_child=`ls -l /etc/consul-template/templates/ | grep -c ^d`

# check if templates exist
if [ $num_child -gt 0 ]; then
  # rm symlink
  rm /etc/consul/conf.d/watch-node.json
  
  # reload consul configuration to refresh watches
  consul reload

  # remove `down` to enable `consul-down` service
  if [ -e "/var/run/s6/services/consul-template/down" ]; then
    rm /var/run/s6/services/consul-template/down
  fi
  
  # execute `s6-svc -u` to notify supervisor that `consul-template` service should start
  s6-svc -u /var/run/s6/services/consul-template
fi
