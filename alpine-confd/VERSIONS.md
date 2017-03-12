# alpine-confd

This file contains all software versions, that correspond to a version of this image itself. Read more about the [alpine-confd image here][alpineconfd].

## Latest

Same as v3.1.0.

Usage: `smebberson/alpine-confd` or `smebberson/alpine-confd:latest`.

## v3.1.0

- [smebberson/alpine-base: v3.1.0][smebbersonalpinebase310]
- [confd v0.11.0][confd]

Improvements:

- Updates to alpine-base (go-dnsmasq and s6-overlay).

Usage: `smebberson/alpine-confd:3.1.0`.

## v3.0.0

- [smebberson/alpine-base: v3.0.0][smebbersonalpinebase300]
- [confd v0.11.0][confd]

Improvements:

- Updates to alpine-base (Alpine Linux).

Usage: `smebberson/alpine-confd:3.0.0`.

## v2.0.0

- [smebberson/alpine-base: v2.0.0][smebbersonalpinebase200]
- [confd v0.11.0][confd]

Improvements:

- Updates to alpine-base (Alpine Linux).

Usage: `smebberson/alpine-confd:2.0.0`.

## v1.0.2

- [smebberson/alpine-base: v1.2.1][smebbersonalpinebase120]
- [confd v0.11.0][confd]

Improvements:

- The `GOMAXPROCS` environment variable has been removed; as of [Go 1.5][go15] this is set dynamically. Confd is now built with Go 1.5.x.

Usage: `smebberson/alpine-confd:1.0.2`.

## v1.0.1

- [smebberson/alpine-base: v1.2.1][smebbersonalpinebase120]
- [confd v0.11.0][confd]

Usage: `smebberson/alpine-confd:1.0.1`.

## v1.0.0

- [smebberson/alpine-base: v1.2.0][smebbersonalpinebase120]
- [confd v0.11.0][confd]

Usage: `smebberson/alpine-confd:1.0.0`.

[smebbersonalpinebase120]: https://github.com/smebberson/docker-alpine/tree/alpine-base-v1.2.0/alpine-base
[smebbersonalpinebase200]: https://github.com/smebberson/docker-alpine/tree/alpine-base-v2.0.0/alpine-base
[smebbersonalpinebase300]: https://github.com/smebberson/docker-alpine/tree/alpine-base-v3.0.0/alpine-base
[smebbersonalpinebase310]: https://github.com/smebberson/docker-alpine/tree/alpine-base-v3.1.0/alpine-base
[confd]: https://github.com/kelseyhightower/confd
[alpineconfd]: https://github.com/smebberson/docker-alpine/tree/master/alpine-confd
[go15]: https://golang.org/doc/go1.5
