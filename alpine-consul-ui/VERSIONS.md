# alpine-consul-ui

This file contains all software versions, that correspond to a version of this image itself. Read more about the [alpine-consul-ui image here][alpineconsului].

## Latest

Same as v2.0.0.

Usage: `smebberson/alpine-consul-ui` or `smebberson/alpine-consul-ui:latest`.

## v2.0.0

- [smebberson/alpine-consul: v3.0.0][smebbersonalpineconsul300]
- [Consul v0.6.4][consului]

__*Breaking changes*__:

- This release updates to [alpine-base v3.0.0 which contains breaking changes](https://github.com/smebberson/docker-alpine/blob/master/alpine-base/VERSIONS.md#v300). You should review them as required.
- Assumes joining a zero-conf bootstrapped Consul cluster which requires Docker 1.10+. You should [review the usage guide](https://github.com/smebberson/docker-alpine/tree/master/alpine-consul#usage) for more information.

Usage: `smebberson/alpine-consul-ui:2.0.0`.

## v1.0.0

- [smebberson/alpine-consul: v1.0.0][smebbersonalpineconsul100]
- [Consul UI v5.2.0][consului]

Usage: `smebberson/alpine-consul-ui:1.0.0`.

[consului]: https://demo.consul.io/ui/
[alpineconsului]: https://github.com/smebberson/docker-alpine/tree/master/alpine-consul-ui
[smebbersonalpineconsul300]: https://github.com/smebberson/docker-alpine/tree/alpine-consul-v3.0.0/alpine-consul
[smebbersonalpineconsul100]: https://github.com/smebberson/docker-alpine/tree/alpine-consul-v1.0.0/alpine-consul
