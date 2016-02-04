alpine-base
===========

This file contains all software versions, that correspond to a version of this image itself. Read more about the [alpine-base image here][alpinebase].

## Latest

Same as v1.3.0.

Usage: `smebberson/alpine-base` or `smebberson/alpine-base:latest`.

## v1.3.0

- [alpinelinux](Alpine linux): v3.3
- [s6-overlay][s6-overlay]: v1.17.1.1
- [go-dnsmasq][godnsmasq]: v0.9.8

Improvements:

- [alpinelinux](Alpine linux): v3.3
- [s6-overlay][s6-overlay]: v1.17.7.1

Usage: `smebberson/alpine-base:1.3.0`.


## v1.2.1

- [alpinelinux](Alpine linux): v3.2
- [s6-overlay][s6-overlay]: v1.16.0.1
- [go-dnsmasq][godnsmasq]: v0.9.8

Improvements:

- Via [go-dnsmasq][godnsmasq], adds support for DNS `search` keyword. Fixes DNS-based service discovery on platforms like Kubernetes and Tutum.

Usage: `smebberson/alpine-base:1.2.1`.

## v1.2.0

- [alpinelinux](Alpine linux): v3.2
- [s6-overlay][s6-overlay]: v1.16.0.1

Improvements:

- removes `ADD` in favour of `RUN curl` as per Docker Dockerfile best practices.

Usage: `smebberson/alpine-base:1.2.0`.

## v1.1.0

- [alpinelinux](Alpine linux): v3.2
- [s6-overlay][s6-overlay]: v1.14.0.4

Usage: `smebberson/alpine-base:1.1.0`.

## v1.0.0

- [alpinelinux](Alpine linux): v3.2
- [s6-overlay][s6-overlay]: v1.13.0.0

Usage: `smebberson/alpine-base:1.0.0`.

[s6-overlay]: https://github.com/just-containers/s6-overlay
[alpinelinux]: https://www.alpinelinux.org/
[alpinebase]: https://github.com/smebberson/docker-alpine/tree/master/alpine-base
[godnsmasq]: https://github.com/janeczku/go-dnsmasq
