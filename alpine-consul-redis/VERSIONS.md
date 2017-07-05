# alpine-consul-redis

This file contains all software versions, that correspond to a version of this image itself. Read more about the [alpine-consul-redis image here][alpineconsulredis].

## Latest

Same as v2.2.0.

Usage: `smebberson/alpine-consul-redis` or `smebberson/alpine-consul-redis:latest`.

## v2.2.0

- [smebberson/alpine-consul-base: v4.2.0][smebbersonalpineconsulbase420]
- [redis][redis]: v3.2.5

Improvements:

- Updated to `alpine-consul-base:4.2.0`.

Usage: `smebberson/alpine-consul-redis:2.2.0`.

## v2.1.0

- [smebberson/alpine-consul-base: v4.1.0][smebbersonalpineconsulbase410]
- [redis][redis]: v3.2.0

Improvements:

- Updated to `alpine-consul-base:4.1.0`.

Usage: `smebberson/alpine-consul-redis:2.1.0`.

## v2.0.0

- [smebberson/alpine-consul-base: v4.0.0][smebbersonalpineconsulbase400]
- [redis][redis]: v2.8.23

__*Breaking changes*__:

- This release updates to [alpine-consul-base v4.0.0 which contains breaking changes](https://github.com/smebberson/docker-alpine/blob/master/alpine-consul-base/VERSIONS.md#v400). You should review them as required.
- With the upgrade to alpine-consul-base v4.0.0, this image assumes joining a zero-conf bootstrapped Consul cluster which requires Docker 1.10+. You should [review the usage guide](https://github.com/smebberson/docker-alpine/tree/master/alpine-consul#usage) for more information.

Usage: `smebberson/alpine-consul-redis:2.0.0`.

## v1.0.0

- [smebberson/alpine-consul-base: v1.0.0][smebbersonalpineconsulbase100]
- [redis][redis]: v2.8.23

Usage: `smebberson/alpine-consul-redis:1.0.0`.

[redis]: http://redis.io/
[alpineconsulredis]: https://github.com/smebberson/docker-alpine/tree/master/alpine-consul-redis
[smebbersonalpineconsulbase420]: https://github.com/smebberson/docker-alpine/tree/alpine-consul-base-v4.2.0/alpine-consul-base
[smebbersonalpineconsulbase410]: https://github.com/smebberson/docker-alpine/tree/alpine-consul-base-v4.1.0/alpine-consul-base
[smebbersonalpineconsulbase400]: https://github.com/smebberson/docker-alpine/tree/alpine-consul-base-v4.0.0/alpine-consul-base
[smebbersonalpineconsulbase100]: https://github.com/smebberson/docker-alpine/tree/alpine-consul-base-v1.0.0/alpine-consul-base
