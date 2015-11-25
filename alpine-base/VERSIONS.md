alpine-base
===========

This file contains all software versions, that correspond to a version of this image itself. Read more about the [alpine-base image here][alpinebase].

## Latest

Same as v1.2.0.

Usage: `smebberson/alpine-base` or `smebberson/alpine-base:latest`.

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
