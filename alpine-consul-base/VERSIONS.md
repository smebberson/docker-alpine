# alpine-consul-base

This file contains all software versions, that correspond to a version of this image itself. Read more about the [alpine-consul-base image here][alpineconsulbase].

## Latest

Same as v4.0.0.

Usage: `smebberson/alpine-consul-base` or `smebberson/alpine-consul-base:latest`.

## v4.0.0

- [smebberson/alpine-consul: v3.0.0][alpineconsul300]

__*Breaking changes*__:

- This release updates to [alpine-base v3.0.0 which contains breaking changes](https://github.com/smebberson/docker-alpine/blob/master/alpine-base/VERSIONS.md#v300). You should review them as required.
- This release updates to alpine-consul v3.0.0 and assumes joining a zero-conf bootstrapped Consul cluster which requires Docker 1.10+. You should [review the usage guide](https://github.com/smebberson/docker-alpine/tree/master/alpine-consul#usage) for more information.
- If Consul exits or crashes, it will automatically be restarted. The container is no longer brought down.
- There is no longer a `/etc/services.d/consul/run` script on this container. It uses the `run` script from alpine-consul.

Usage: `smebberson/alpine-consul-base:4.0.0`.

## v3.0.0

- [smebberson/alpine-consul: v2.0.0][alpineconsul200]
- [consul-template: v0.14.0][consultemplate]

Improvements:

- [alpine-consul][alpine-consul] has been updated (many improvements).

Usage: `smebberson/alpine-consul-base:3.0.0`.

## v2.0.0

- [smebberson/alpine-consul: v1.1.0][alpineconsul110]
- [consul-template: v0.14.0][consultemplate]

Improvements:

- consul-template was added.

__*Breaking changes*__:

- consul configuration directory is now located at `/etc/consul/conf.d/`

Usage: `smebberson/alpine-consul-base:2.0.0`.

## v1.1.0

- [smebberson/alpine-consul: v1.1.0][alpineconsul110]

Usage: `smebberson/alpine-consul-base:1.1.0`.

## v1.0.0

- [smebberson/alpine-consul: v1.0.0][alpineconsul100]

Usage: `smebberson/alpine-consul-base:1.0.0`.

[alpineconsulbase]: https://github.com/smebberson/docker-alpine/tree/master/alpine-consul-base
[alpineconsul]: https://github.com/smebberson/docker-alpine/tree/master/alpine-consul
[alpineconsul300]: https://github.com/smebberson/docker-alpine/tree/alpine-consul-v3.0.0/alpine-consul
[alpineconsul200]: https://github.com/smebberson/docker-alpine/tree/alpine-consul-v2.0.0/alpine-consul
[alpineconsul110]: https://github.com/smebberson/docker-alpine/tree/alpine-consul-v1.1.0/alpine-consul
[alpineconsul100]: https://github.com/smebberson/docker-alpine/tree/alpine-consul-v1.0.0/alpine-consul
[consultemplate]: https://github.com/hashicorp/consul-template
