# alpine-base

This file contains all software versions, that correspond to a version of this image itself. Read more about the [alpine-base image here][alpinebase].

## Latest

Same as v3.1.0.

Usage: `smebberson/alpine-base` or `smebberson/alpine-base:latest`.

## v3.1.0

- [alpinelinux](Alpine Linux): v3.4
- [s6-overlay][s6-overlay]: v1.18.1.5
- [go-dnsmasq][godnsmasq]: v1.0.7

Improvements:

- Updates to go-dnsmasq (resolves issue on container restarts) and s6-overlay.

Usage: `smebberson/alpine-base:3.1.0`.

## v3.0.0

- [alpinelinux](Alpine Linux): v3.4
- [s6-overlay][s6-overlay]: v1.17.2.0
- [go-dnsmasq][godnsmasq]: v1.0.6

Improvements:

- Updates to Alpine Linux and go-dnsmasq.
- Renamed `container-ip` to `host-ip` script.
- Tested go-dnsmasq DNS settings against Docker v1.10 and Docker v1.11+.

__*Breaking changes*__:

- Any scripts referencing `container-ip` need to be updated to reference `host-ip` instead.

Usage: `smebberson/alpine-base:3.0.0`.

## v2.0.0

- [alpinelinux](Alpine Linux): v3.3
- [s6-overlay][s6-overlay]: v1.17.2.0
- [go-dnsmasq][godnsmasq]: v1.0.4

Improvements:

- Updates to Alpine Linux, s6-overlay and go-dnsmasq.

Usage: `smebberson/alpine-base:2.0.0`.

## v1.2.1

- [alpinelinux](Alpine Linux): v3.2
- [s6-overlay][s6-overlay]: v1.16.0.1
- [go-dnsmasq][godnsmasq]: v0.9.8

Improvements:

- Via [go-dnsmasq][godnsmasq], adds support for DNS `search` keyword. Fixes DNS-based service discovery on platforms like Kubernetes and Tutum.

Usage: `smebberson/alpine-base:1.2.1`.

## v1.2.0

- [alpinelinux](Alpine Linux): v3.2
- [s6-overlay][s6-overlay]: v1.16.0.1

Improvements:

- removes `ADD` in favour of `RUN curl` as per Docker Dockerfile best practices.

Usage: `smebberson/alpine-base:1.2.0`.

## v1.1.0

- [alpinelinux](Alpine Linux): v3.2
- [s6-overlay][s6-overlay]: v1.14.0.4

Usage: `smebberson/alpine-base:1.1.0`.

## v1.0.0

- [alpinelinux](Alpine Linux): v3.2
- [s6-overlay][s6-overlay]: v1.13.0.0

Usage: `smebberson/alpine-base:1.0.0`.

[s6-overlay]: https://github.com/just-containers/s6-overlay
[alpinelinux]: https://www.alpinelinux.org/
[alpinebase]: https://github.com/smebberson/docker-alpine/tree/master/alpine-base
[godnsmasq]: https://github.com/janeczku/go-dnsmasq
