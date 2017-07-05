# alpine-consul

This file contains all software versions, that correspond to a version of this image itself. Read more about the [alpine-consul image here][alpineconsul].

## Latest

Same as v3.2.0.

Usage: `smebberson/alpine-consul` or `smebberson/alpine-consul:latest`.

## v3.2.0

- [smebberson/alpine-base: v3.2.0][smebbersonalpinebase310]
- [consul v0.8.5][consul]

Improvements:

- Everything from the `v3.2.0` beta rounds.
- Consul was upgraded to `v0.8.5`.

Usage: `smebberson/alpine-consul:3.2.0`.

## v3.2.0-beta.2

- [smebberson/alpine-base: v3.2.0][smebbersonalpinebase320]
- [consul v0.8.4][consul]

Improvements:

- Consul was upgraded to `v0.8.4`.
- Added `util-linux` package for `uuidgen` binary.
- `consul-node-id` now uses `uuidgen` for better UUID generation that doesn't clash.

Usage: `smebberson/alpine-consul:3.2.0-beta.2`.

## v3.2.0-beta.1

- [smebberson/alpine-base: v3.2.0][smebbersonalpinebase320]
- [consul v0.8.3][consul]

Improvements:

- Consul was upgraded to `v0.8.3`.
- go-dnsmasq run user is now configurable via `GO_DNSMASQ_RUNAS`.
- Consul run user is now configurable via `CONSUL_RUNAS`.
- The Consul bootstrap process will now output debug information to `CONSUL_BOOTSTRAP_LOG_FILE` (defaults to `/var/log/consul-bootstrap/consul-bootstrap.log`). Set `CONSUL_BOOTSTRAP_DEBUG` to `true`.
- Added the new `-data-id` argument (customisable via replacing the `/usr/bin/consul-node-id` script).
- Added the `-data-dir` argument (customisable via `CONSUL_DATA_DIR`).
- Exposed 8600 and 8600/udp by default.
- Added the `CONSUL_AVAILABLE_SLEEP` ENV variable to customise the amount of seconds to sleep between checking for other consul servers

Usage: `smebberson/alpine-consul:3.2.0-beta.1`.

## v3.1.1

- [smebberson/alpine-base: v3.1.0][smebbersonalpinebase310]
- [consul v0.7.1][consul]

Improvements:

- Consul was upgraded to `v0.7.1`.
- go-dnsmasq is now run as the user go-dnsmasq.

Usage: `smebberson/alpine-consul:3.1.1`.

## v3.1.0

- [smebberson/alpine-base: v3.1.0][smebbersonalpinebase310]
- [consul v0.7.0][consul]

Improvements:

- Consul was upgraded to `v0.7.0`.
- Containers no longer exit if Consul dies. Consul is simply restarted.
- `CONSUL_ADVERTISE_WAN` environment variable can be set to alter the IP Consul reports to WAN.
- `CONSUL_JOIN_WAN` environment variable can be set to make Consul communicate over WAN.
- `CONSUL_DC` environment variable can be set to alter the name of the data center that Consul reports.

Usage: `smebberson/alpine-consul:3.1.0`.

## v3.0.0

- [smebberson/alpine-base: v3.0.0][smebbersonalpinebase300]

Improvements:

- Provides zero-conf Consul bootstrapping (automated Consul cluster setup, expecting three nodes by default).
- `CONSUL_SERVER_NAME` environment variable can be set to alter default Consul containers name (defaults to `consul`).
- `CONSUL_CONFIG_DIR` environment variable can be set to alter the Consul configuration directory (defaults to `/etc/consul/conf.d/bootstrap`).
- `CONSUL_DOMAIN` environment variable can be set to alter the Consul DNS name (defaults to `consul`).
- The `/etc/services.d/consul/run` script now uses multiple `-retry-join` flags to improve connection attempts.
- The `/etc/services.d/consul/run` issues `-client 0.0.0.0` so that interfaces are bound to first available IP address (not just 127.0.0.1 loopback).
- The `/etc/services.d/consul/run` sets the `-advertise` flag to the container IP as reported by `host-ip`.
- Improves Consul cluster-leaves when using `CTRL+C` in development workflows.
- Improves Consul cluster-leaves in the event of a Consul service failure.

__*Breaking changes*__:

- This release updates to [alpine-base v3.0.0 which contains breaking changes](https://github.com/smebberson/docker-alpine/blob/master/alpine-base/VERSIONS.md#v300). You should review them as required.
- Provides zero-conf Consul bootstrap which assumes a specific setup and Docker 1.10+. You should [review the usage guide](https://github.com/smebberson/docker-alpine/tree/master/alpine-consul#usage) for more information.

Usage: `smebberson/alpine-consul:3.0.0`.

## v2.0.0

- [smebberson/alpine-base: v2.0.0][smebbersonalpinebase200]
- [consul v0.6.4][consul]

Improvements:

- Updates to consul and alpine-base (Alpine Linux).
- Consul no longer performs an update check.
- Consul's DNS domain is now configurable.
- go-dnsmasq has been updated to hand `*.consul` DNS queries off to Consul.

__*Breaking changes*__:

- This release updates Consul from `0.5.2` to `0.6.4`. You should review [Consul's upgrade documentation][consulupgrade] as there are important differences you'll need to be aware of.

Usage: `smebberson/alpine-consul:2.0.0`.

## v1.1.0

- [smebberson/alpine-base: v1.2.0][smebbersonalpinebase120]
- [consul v0.5.2][consul]

Usage: `smebberson/alpine-consul:1.1.0`.

## v1.0.0

- [smebberson/alpine-base: v1.0.0][smebbersonalpinebase100]
- [consul v0.5.2][consul]

Usage: `smebberson/alpine-consul:1.0.0`.

[consul]: https://consul.io/
[consulupgrade]: https://www.consul.io/docs/upgrade-specific.html
[alpineconsul]: https://github.com/smebberson/docker-alpine/tree/master/alpine-consul
[smebbersonalpinebase320]: https://github.com/smebberson/docker-alpine/blob/alpine-base-v3.2.0/alpine-base
[smebbersonalpinebase310]: https://github.com/smebberson/docker-alpine/blob/alpine-base-v3.1.0/alpine-base
[smebbersonalpinebase300]: https://github.com/smebberson/docker-alpine/blob/alpine-base-v3.0.0/alpine-base
[smebbersonalpinebase200]: https://github.com/smebberson/docker-alpine/blob/alpine-base-v2.0.0/alpine-base
[smebbersonalpinebase120]: https://github.com/smebberson/docker-alpine/blob/alpine-base-v1.2.0/alpine-base
[smebbersonalpinebase100]: https://github.com/smebberson/docker-alpine/blob/alpine-base-v1.0.0/alpine-base
