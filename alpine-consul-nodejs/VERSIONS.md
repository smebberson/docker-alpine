# alpine-consul-nodejs

This file contains all software versions, that correspond to a version of this image itself. Read more about the [alpine-consul-nodejs image here][alpineconsulnodejs].

Looking for a particular version of Node.js? [See NODEJS.md for more information.](https://github.com/smebberson/docker-alpine/blob/master/alpine-consul-nodejs/NODEJS.md)

## Latest

Same as v5.11.0.

Usage: `smebberson/alpine-consul-nodejs` or `smebberson/alpine-consul-nodejs:latest`.

## v5.11.0

- [Node.js: v6.11.0][nodejs]
- [npm: v3.10.10][npm]

Improvements:

- Everything from the `v5.11.0` beta rounds.

Usage: `smebberson/alpine-consul-nodejs:5.11.0`.

## v5.11.0-beta.2

- [Node.js: v6.11.0][nodejs]
- [npm: v3.10.10][npm]

Usage: `smebberson/alpine-consul-nodejs:5.11.0-beta.2`.

## v5.11.0-beta.1

- [Node.js: v6.11.0][nodejs]
- [npm: v3.10.10][npm]

Usage: `smebberson/alpine-consul-nodejs:5.11.0-beta.1`.

## v5.10.1

- [Node.js: v6.10.1][nodejs]
- [npm: v3.10.10][npm]

Usage: `smebberson/alpine-consul-nodejs:5.10.1`.

## v5.10.0

- [Node.js: v6.10.0][nodejs]
- [npm: v3.10.10][npm]

Usage: `smebberson/alpine-consul-nodejs:5.10.0`.

## v5.9.5

- [Node.js: v6.9.5][nodejs]
- [npm: v3.10.10][npm]

Usage: `smebberson/alpine-consul-nodejs:5.9.5`.

## v5.9.4

- [Node.js: v6.9.4][nodejs]
- [npm: v3.10.10][npm]

Usage: `smebberson/alpine-consul-nodejs:5.9.4`.

## v5.9.3

- [Node.js: v6.9.3][nodejs]
- [npm: v3.10.10][npm]

Usage: `smebberson/alpine-consul-nodejs:5.9.3`.

## v5.9.2

- [Node.js: v6.9.2][nodejs]
- [npm: v3.10.10][npm]

Usage: `smebberson/alpine-consul-nodejs:5.9.2`.

## v5.9.1

- [Node.js: v6.9.1][nodejs]
- [npm: v3.10.10][npm]

Usage: `smebberson/alpine-consul-nodejs:5.9.1`.

## v5.9.0

- [Node.js: v6.9.0][nodejs]
- [npm: v3.10.10][npm]

Usage: `smebberson/alpine-consul-nodejs:5.9.0`.

## v5.8.0

- [Node.js: v6.8.0][nodejs]
- [npm: v3.10.10][npm]

Usage: `smebberson/alpine-consul-nodejs:5.8.0`.

## v5.7.0

- [Node.js: v6.7.0][nodejs]
- [npm: v3.10.10][npm]

Usage: `smebberson/alpine-consul-nodejs:5.7.0`.

## v5.6.0

- [Node.js: v6.6.0][nodejs]
- [npm: v3.10.10][npm]

Usage: `smebberson/alpine-consul-nodejs:5.6.0`.

## v5.5.0

- [Node.js: v6.5.0][nodejs]
- [npm: v3.10.10][npm]

Usage: `smebberson/alpine-consul-nodejs:5.5.0`.

## v5.4.0

- [Node.js: v6.4.0][nodejs]
- [npm: v3.10.10][npm]

Usage: `smebberson/alpine-consul-nodejs:5.4.0`.

## v5.3.1

- [Node.js: v6.3.1][nodejs]
- [npm: v3.10.9][npm]

Usage: `smebberson/alpine-consul-nodejs:5.3.1`.

## v5.3.0

- [Node.js: v6.3.0][nodejs]
- [npm: v3.10.9][npm]

Improvements:

- Upgraded to [docker-alpine-base 4.1.0][smebbersonalpineconsulbase410].

Usage: `smebberson/alpine-consul-nodejs:5.3.0`.

## v5.2.2

- [Node.js: v6.2.2][nodejs]
- [npm: v3.9.5][npm]

Usage: `smebberson/alpine-consul-nodejs:5.2.2`.

## v5.2.1

- [Node.js: v6.2.1][nodejs]
- [npm: v3.9.5][npm]

Usage: `smebberson/alpine-consul-nodejs:5.2.1`.

## v5.2.0

- [Node.js: v6.2.0][nodejs]
- [npm: v3.9.5][npm]

Usage: `smebberson/alpine-consul-nodejs:5.2.0`.

## v5.1.0

- [Node.js: v6.1.0][nodejs]
- [npm: v3.9.5][npm]

Usage: `smebberson/alpine-consul-nodejs:5.1.0`.

## v5.0.0

- [Node.js: v6.0.0][nodejs]
- [npm: v3.9.5][npm]

Usage: `smebberson/alpine-consul-nodejs:5.0.0`.

## v4.0.0

- [smebberson/alpine-consul-base: v4.0.0][smebbersonalpineconsulbase400]
- [Node.js: v5.9.1][nodejs]
- [npm: v3.9.5][npm]

__*Breaking changes*__:

- This release updates to [alpine-base v4.0.0 which contains breaking changes](https://github.com/smebberson/docker-alpine/blob/master/alpine-consul-base/VERSIONS.md#v400). You should review them as required.
- With the upgrade to alpine-consul-base v4.0.0, this image assumes joining a zero-conf bootstrapped Consul cluster which requires Docker 1.10+. You should [review the usage guide](https://github.com/smebberson/docker-alpine/tree/master/alpine-consul#usage) for more information.

Usage: `smebberson/alpine-consul-nodejs:4.0.0`.

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
[smebbersonalpineconsulbase410]: https://github.com/smebberson/docker-alpine/tree/alpine-consul-base-v4.1.0/alpine-consul-base
[smebbersonalpineconsulbase400]: https://github.com/smebberson/docker-alpine/tree/alpine-consul-base-v4.0.0/alpine-consul-base
[smebbersonalpineconsulbase200]: https://github.com/smebberson/docker-alpine/tree/alpine-consul-base-v2.0.0/alpine-consul-base
[smebbersonalpineconsulbase100]: https://github.com/smebberson/docker-alpine/tree/alpine-consul-base-v1.0.0/alpine-consul-base
[alpineconsulnodejs]: https://github.com/smebberson/docker-alpine/tree/master/alpine-consul-nodejs
