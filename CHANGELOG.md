
# Changelog for the Consul-based image upgrades

## 2016.05.11

- `alpine-consul`: customised `/etc/services.d/consul/run` removing `-client $BIND` in favour of `-advertise $BIND -client 0.0.0.0` so that Consul works in more environments (such as overlay networks or environments with multiple IPs).
- `alpine-consul-base`: customer `/etc/services.d/consul/run` removing `-client $BIND` in favour of `-advertise $BIND -client 0.0.0.0` so that Consul works in more environments (such as overlay networks or environments with multiple IPs).

## 2016.05.10

- General: moved all temporary scripts created in the images in `examples/complete` back into their respective `docker-alpine` containers (for example `container-ip`, `consul-join`, `consul-available` and all run scripts).
- `alpine-consul-nginx`: fixed issues in which the container assumed an incorrect default root.
- `alpine-consul-nginx`: moved to the built-in `http` Consul check replacing the shell script based version we had.
- General: reduced output from `consul-available` script. It would unnecessarily print an IP to `stdout`.
- `alpine-consul`: now expects to be bootstrapped with three other nodes as the default.
- `alpine-consul-base`: all images extending `alpine-consul-base` will now automatically join a Consul cluster.
- General: removed the `examples/complete/consul` container as it can now be done in just a few lines in the `docker-compose.yml`. Bootstrapping a multi-node Consul cluster is so simple now! FTW!
- General: removed the `examples/complete/consului` container as it can now be done in just a few lines in the `docker-compose.yml` (an entire container just for the UI is no longer required).

## 2016.05.04

- General: Create a `container-ip` script that will be used in all other scripts when the IP of the container is required. This will make it easy to override this function in just one place (https://github.com/smebberson/docker-alpine/issues/41). Lives here in `alpine-base`.
- `alpine-base`: `go-dnsmasq` has been updated to `1.0.4`.
- `alpine-base`: `--append-search-domains` flag has been removed from `go-dnsmasq` start. This was because Docker 1.10+ seems to add `localdomain` as a search domain to `/etc/resolv.conf` and makes queries longer.
- `alpine-base`: `--ndots "1" --fwd-ndots "0"` flags have been added to `go-dnsmasq` start. These have been added because Docker 1.10+ adds `options ndots:0` to `/etc/resolv.conf` and `go-dnsmasq` requires a setting of 1. And `--fwd-ndots "0"` instructs `go-dnsmasq` to forward queries to domains without dots (i.e. `consul` as we do now) to upstream DNS servers.
- Consul-related: `-retry-interval` has been reduced from `15s` to `5s`.

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
