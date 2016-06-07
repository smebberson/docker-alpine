# alpine-consul

This file contains all software versions, that correspond to a version of this image itself. Read more about the [alpine-consul image here][alpineconsul].

## Latest

Same as v2.0.0.

Usage: `smebberson/alpine-consul` or `smebberson/alpine-consul:latest`.

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
[smebbersonalpinebase200]: https://github.com/smebberson/docker-alpine/blob/alpine-base-v2.0.0/alpine-base
[smebbersonalpinebase120]: https://github.com/smebberson/docker-alpine/blob/alpine-base-v1.2.0/alpine-base/Dockerfile
[smebbersonalpinebase100]: https://github.com/smebberson/docker-alpine/blob/alpine-base-v1.0.0/alpine-base/Dockerfile
