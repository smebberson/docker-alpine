# alpine-consul-apache

This file contains all software versions, that correspond to a version of this image itself.

## Latest

Same as v2.0.0.

Usage: `smebberson/alpine-consul-apache` or `smebberson/alpine-consul-apache:latest`.

## v2.0.0

- [smebberson/alpine-consul-base: v4.1.0][smebbersonalpineconsulbase110]
- [apache: v2.4.23][apache]

Improvements:

- Upgraded to Consul's built in HTTP(S) check.

__*Breaking changes*__:

- This has jumped from `alpine-consul-base:1.1.0` to `alpine-consul-base:4.1.0`. There have been many changes. Please [review the notes on these changes here][smebbersonalpineconsulbase410updates].

Usage: `smebberson/alpine-consul-apache:2.0.0`.

## v1.0.0

- [smebberson/alpine-consul-base: v1.1.0][smebbersonalpineconsulbase110]
- [apache: v2.4.16][apache]

Usage: `smebberson/alpine-consul-apache:1.0.0`.

[apache]: httsp://httpd.apache.org/
[smebbersonalpineconsulbase410]: https://github.com/smebberson/docker-alpine/tree/alpine-consul-base-v4.1.0/alpine-consul-base
[smebbersonalpineconsulbase410updates]: https://github.com/smebberson/docker-alpine/blob/alpine-consul-base-v4.1.0/alpine-consul-base/VERSIONS.md
[smebbersonalpineconsulbase110]: https://github.com/smebberson/docker-alpine/tree/alpine-consul-base-v1.1.0/alpine-consul-base
