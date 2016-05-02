
# Changelog for the Consul-based image upgrades

## 2016.05.02

- General: Docker Engine has been updated to 1.11 (run (on host) `vagrant destroy && vagrant reload --provision`).
- Consul-related: `examples/complete/consul`, `examples/complete/consul-ui`, `examples/complete/static` were all updated to enable zero-conf Consul bootstrapping.

## 2016.04.28

- Consul-related: `alpine-consul-base` no longer restarts the container if Consul fails. s6 simply restarts Consul.
- Consul-related: `leave_on_terminate` has been removed from Consul configuration files.
- Consul-related: remove `exec` from start scripts as this was interfering with signals and proper shutdown order.
- Consul-related: `alpine-consul-base` now issues `-bind` and `-client` when starting Consul such that all Consul interfaces are being bound to the IP of the container not `localhost` (this change means that a query to any Consul interface originating externally from the container itself can be used).
- Consul-related: `alpine-consul-ui` now issues `-client` when starting Consul.
- Consul-related: the `cont-finish.d/00-consul` script in `alpine-consul` now issues the `consul leave` command rather than `consul force-leave` and provides the `-rpc-addr` flag because we've moved away from the default of `localhost`. Removing `exec` from the Consul start scripts has made this possible as the scripts in `cont-finish.d` are run prior to the service directory `finish` scripts. This has made leaving the Consul cluster much, much, much more consistent.
- Consul-related: `alpine-consul` now distinguishes between exiting because of `CTRL+C` (while developing) and a crash of the Consul process (you can simulate with `kill -9 <pid>`). When exiting because of `CTRL+C` the attempt to bring down the container is not made as this is already happening. This has tidied up the `s6-svscanctl: fatal: unable to control /var/run/s6/services: supervisor not listening` error.
- go-dnsmasq-related: go-dnsmasq has been updated as the Consul DNS service is no longer bound to `localhost` but the IP of the container instead.
- General: preferring `$VARNAME` syntax over `${VARNAME}` in shell scripts.
- General: Docker Compose was updated to 1.7.0 (run (on guest) `sudo rm /etc/vagrant/compose` and then (on host) `vagrant reload --provision`) to upgrade.
