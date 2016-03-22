alpine-confd
============

This file contains all software versions, that correspond to a version of this image itself. Read more about the [alpine-confd image here][alpineconfd].

## Latest

Same as v1.0.2.

Usage: `smebberson/alpine-confd` or `smebberson/alpine-confd:latest`.

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

[smebbersonalpinebase120]: https://github.com/smebberson/docker-alpine/tree/e630bad2eebad48231cb61b6139a0aa7603a5910/alpine-base
[confd]: https://github.com/kelseyhightower/confd
[alpineconfd]: https://github.com/smebberson/docker-alpine/tree/master/alpine-confd
[go15]: https://golang.org/doc/go1.5
