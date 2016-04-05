# alpine-consul-nodejs

This file contains all software versions, that correspond to a version of this image itself. Read more about the [alpine-consul-nodejs image here][alpineconsulnodejs].

Looking for a particular version of Node.js? [See NODEJS.md for more information.](https://github.com/smebberson/docker-alpine/blob/master/alpine-consul-nodejs/NODEJS.md)

## Latest

Same as v3.0.0.

Usage: `smebberson/alpine-consul-nodejs` or `smebberson/alpine-consul-nodejs:latest`.

## v3.0.0

- [smebberson/alpine-consul-base: v2.0.0][smebbersonalpineconsulbase200]
- [Node.js: v5.9.0][nodejs]
- [npm: v3.8.2][npm]

Usage: `smebberson/alpine-consul-nodejs:3.0.0`.

## v2.0.0

- [smebberson/alpine-consul-base: v2.0.0][smebbersonalpineconsulbase200]
- [Node.js: v4.4.1][nodejs]
- [npm: v3.8.2][npm]
- **_breaking change_**: consul configuration directory is now located at `/etc/consul/conf.d/`

Usage: `smebberson/alpine-consul-nodejs:2.0.0`.

## v1.0.0

- [smebberson/alpine-consul-base: v1.0.0][smebbersonalpineconsulbase100]
- [Node.js: v0.12.10][nodejs]
- [npm: v3.8.2][npm]

Usage: `smebberson/alpine-consul-nodejs:1.0.0`.

[nodejs]: https://nodejs.org/en/
[npm]: https://www.npmjs.com/
[smebbersonalpineconsulbase100]: https://github.com/smebberson/docker-alpine/tree/alpine-consul-base-v1.0.0/alpine-consul-base
[smebbersonalpineconsulbase200]: https://github.com/smebberson/docker-alpine/tree/alpine-consul-base-v2.0.0/alpine-consul-base
[alpineconsulnodejs]: https://github.com/smebberson/docker-alpine/tree/master/alpine-consul-nodejs
