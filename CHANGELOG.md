
# Changelog

Due to the nature of versioning and the fact this repository houses multiple Docker images, the change log is more of a chronological record of events. Including improvements that are made over time without a specific release, and the actual releases.

Each release records it's own specific changes in a VERSIONS.md file.

## 2016.07.22

- Now using `http://dl-4.alpinelinux.org/alpine/v3.3/main` APK repository to source v1.8.1 of Nginx.

### Releases

- [Released `v3.0.1` of `alpine-consul-nginx`](https://github.com/smebberson/docker-alpine/tree/alpine-consul-nginx-v3.0.1/alpine-consul-nginx)

## 2016.06.08

- Updated the `examples/user-consul-nodejs` to use Docker Compose and zero-conf bootstrapped Consul.
- Updated the `examples/user-consul-nginx` to use Docker Compose and zero-conf bootstrapped Consul.
- Updated the `examples/user-consul-nodejs` to use Docker Compose and zero-conf bootstrapped Consul.
- Removed the `:dev` tags from `examples/complete`.

### Releases

- [Released `v3.0.0` of `alpine-base`](https://github.com/smebberson/docker-alpine/tree/alpine-base-v3.0.0/alpine-base).
- [Released `v3.0.0` of `alpine-consul`](https://github.com/smebberson/docker-alpine/tree/alpine-consul-v3.0.0/alpine-consul)
- [Released `v2.0.0` of `alpine-consul-ui`](https://github.com/smebberson/docker-alpine/tree/alpine-consul-ui-v2.0.0/alpine-consul-ui)
- [Released `v4.0.0` of `alpine-consul-base`](https://github.com/smebberson/docker-alpine/tree/alpine-consul-base-v4.0.0/alpine-consul-base)
- [Released `v4.0.0` of `alpine-consul-nodejs`](https://github.com/smebberson/docker-alpine/tree/alpine-consul-nodejs-v4.0.0/alpine-consul-nodejs)
- [Released `v5.0.0` of `alpine-consul-nodejs`](https://github.com/smebberson/docker-alpine/tree/alpine-consul-nodejs-v5.0.0/alpine-consul-nodejs)
- [Released `v5.1.0` of `alpine-consul-nodejs`](https://github.com/smebberson/docker-alpine/tree/alpine-consul-nodejs-v5.1.0/alpine-consul-nodejs)
- [Released `v5.2.0` of `alpine-consul-nodejs`](https://github.com/smebberson/docker-alpine/tree/alpine-consul-nodejs-v5.2.0/alpine-consul-nodejs)
- [Released `v5.2.1` of `alpine-consul-nodejs`](https://github.com/smebberson/docker-alpine/tree/alpine-consul-nodejs-v5.2.1/alpine-consul-nodejs)
- [Released `v3.0.0` of `alpine-consul-nginx`](https://github.com/smebberson/docker-alpine/tree/alpine-consul-nginx-v3.0.0/alpine-consul-nginx)
- [Released `v2.0.0` of `alpine-consul-redis`](https://github.com/smebberson/docker-alpine/tree/alpine-consul-redis-v2.0.0/alpine-consul-redis)

## 2016.06.07

- `alpine-base`: upgraded to Alpine Linux 3.4 (https://hub.docker.com/_/alpine/).
- `alpine-consul-ui`: disabled Consul version check.

## 2016.05.27

- `alpine-consul-base`: renamed `/usr/bin/container-ip` to `/usr/bin/host-ip` to be more explicit about what it does.
- `alpine-consul-consul`: added `/usr/bin/container-find` which is used to find container IP addresses matching a specific DNS name (by default). This script is used within `consul-join`. Through adding this script, it is now quite easy to customise `host-ip` and `container-find` so that these containers can work in non-standard scenarios (such as Rancher and Docker Cloud). It's easier to overwrite these files which are logic, as opposed to `consul-join` in which you'd need to recreate the logic.
- `alpine-consul-ui`: has been updated to use `host-ip` rather than `container-ip`.
- `alpine-consul`: now sets `CONSUL_SERVER_NAME` environment variable and this is used within the container as the name for DNS queries. By default `alpine-consul` nodes have been setup to use `consul` as their service name, however, with `CONSUL_SERVER_NAME` you can now customise this as required.


## 2016.05.19

- `alpine-consul-base`: `/etc/services.d/consul-template/finish` no longer attempts to bring down the entire container. It is a secondary process and therefore should simply restart.
- `alpine-consul-base`: introduced the `exec` keyword in `/etc/services.d/consul-template/run` when starting `consul-template`. It seems to play nicer and can now receive signals such as `s6-svc -h /var/run/s6/services/consul-template`.

## 2016.05.18

- `alpine-consul`: reverted `consul-join` to use `dig` rather than `getent hosts` so that `-retry-join` flag will use all available consul IPs to attempt to join. This means `container-ip` uses `getent hosts` and `consul-join` uses `dig`. This has proven to be the most stable setup across Docker 1.9 and Docker 1.11.

## 2016.05.17

- `alpine-base`: reverted `container-ip` to use `getent hosts` rather than `dig` to determine the container ip. After testing with Docker 1.9 `getent hosts` is much more stable (essentially until `go-dnsmasq` is up and running).

## 2016.05.13

- General: tagged all builds with `:dev` and will release these on Docker hub now. Final testing before release.
- `alpine-consul-redis`: now inherits from the latest version of `alpine-consul-base`.
- `alpine-consul-redis`: updated to the latest version of Redis 3.2.0. Redis runs with protected mode off assuming that we're running Redis with container-only access and therefore protected mode is not required.
- General: update the example to add session management via Redis (demonstrating load balancing with sticky sessions).

## 2016.05.11

- `alpine-consul`: customised `/etc/services.d/consul/run` removing `-client $BIND` in favour of `-advertise $BIND -client 0.0.0.0` so that Consul works in more environments (such as overlay networks or environments with multiple IPs).
- `alpine-consul-base`: customer `/etc/services.d/consul/run` removing `-client $BIND` in favour of `-advertise $BIND -client 0.0.0.0` so that Consul works in more environments (such as overlay networks or environments with multiple IPs).
- General: updated the example to demonstrate Nginx load balancing to multiple Node.js containers.
- `alpine-consul`: `/usr/bin/consul-join` will now output all consul IPs (excluding itself) with the `-retry-join` argument (for example `-retry-join 172.19.0.7 -retry-join 172.19.0.6`) so that Consul can try mutliple IPs.
- `alpine-consul`: `/etc/services.d/consul/run` now accepts the `CONSUL_CONFIG_DIR` ENV variable for the location of the Consul configuration directory. Set `CONSUL_CONFIG_DIR` in `alpine-consul/Dockerfile`.
- `alpine-consul-base`: removed `/etc/services.d/consul/run` and set `CONSUL_CONFIG_DIR` in `alpine-consul-base/Dockerfile`.
- `alpine-consul-ui`: updated `/etc/services.d/consul/run` to take advantage of improvements listed above and set `CONSUL_CONFIG_DIR` in `alpine-consul-ui/Dockerfile`.

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

- `alpine-consul-base`: no longer restarts the container if Consul fails. s6 simply restarts Consul.
- Consul-related: `leave_on_terminate` has been removed from Consul configuration files.
- Consul-related: remove `exec` from start scripts as this was interfering with signals and proper shutdown order.
- `alpine-consul-base`: now issues `-bind` and `-client` when starting Consul such that all Consul interfaces are being bound to the IP of the container not `localhost` (this change means that a query to any Consul interface originating externally from the container itself can be used).
- `alpine-consul-ui`: now issues `-client` when starting Consul.
- `alpine-consul`: the `cont-finish.d/00-consul` script in `alpine-consul` now issues the `consul leave` command rather than `consul force-leave` and provides the `-rpc-addr` flag because we've moved away from the default of `localhost`. Removing `exec` from the Consul start scripts has made this possible as the scripts in `cont-finish.d` are run prior to the service directory `finish` scripts. This has made leaving the Consul cluster much, much, much more consistent.
- `alpine-consul`: now distinguishes between exiting because of `CTRL+C` (while developing) and a crash of the Consul process (you can simulate with `kill -9 <pid>`). When exiting because of `CTRL+C` the attempt to bring down the container is not made as this is already happening. This has tidied up the `s6-svscanctl: fatal: unable to control /var/run/s6/services: supervisor not listening` error.
- go-dnsmasq-related: go-dnsmasq has been updated as the Consul DNS service is no longer bound to `localhost` but the IP of the container instead.
- General: preferring `$VARNAME` syntax over `${VARNAME}` in shell scripts.
- Development: Docker Compose was updated to 1.7.0 (run (on guest) `sudo rm /etc/vagrant/compose` and then (on host) `vagrant reload --provision`) to upgrade.
