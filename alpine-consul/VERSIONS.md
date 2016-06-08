# alpine-consul

This file contains all software versions, that correspond to a version of this image itself. Read more about the [alpine-consul image here][alpineconsul].

## Latest

Same as v3.0.0.

Usage: `smebberson/alpine-consul` or `smebberson/alpine-consul:latest`.

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
[smebbersonalpinebase300]: https://github.com/smebberson/docker-alpine/blob/alpine-base-v3.0.0/alpine-base
[smebbersonalpinebase200]: https://github.com/smebberson/docker-alpine/blob/alpine-base-v2.0.0/alpine-base
[smebbersonalpinebase120]: https://github.com/smebberson/docker-alpine/blob/alpine-base-v1.2.0/alpine-base
[smebbersonalpinebase100]: https://github.com/smebberson/docker-alpine/blob/alpine-base-v1.0.0/alpine-base
