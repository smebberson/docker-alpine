# alpine-consul-nginx

This file contains all software versions, that correspond to a version of this image itself. Read more about the [alpine-consul-nginx image here][alpineconsulnginx].

## Latest

Same as v3.0.0.

Usage: `smebberson/alpine-consul-nginx` or `smebberson/alpine-consul-nginx:latest`.

## v3.0.0

- [smebberson/alpine-consul-base: v4.0.0][smebbersonalpineconsulbase400]
- [nginx][nginx]: v1.8.1

__*Breaking changes*__:

- This release updates to [alpine-consul-base v4.0.0 which contains breaking changes](https://github.com/smebberson/docker-alpine/blob/master/alpine-consul-base/VERSIONS.md#v400). You should review them as required.
- With the upgrade to alpine-consul-base v4.0.0, this image assumes joining a zero-conf bootstrapped Consul cluster which requires Docker 1.10+. You should [review the usage guide](https://github.com/smebberson/docker-alpine/tree/master/alpine-consul#usage) for more information.

Usage: `smebberson/alpine-consul-nginx:3.0.0`.

## v2.0.0

- [smebberson/alpine-consul-base: v2.0.0][smebbersonalpineconsulbase200]
- [nginx][nginx]: v1.8.1
- **_breaking change_**: consul configuration directory is now located at `/etc/consul/conf.d/`

Usage: `smebberson/alpine-consul-nginx:2.0.0`.

## v1.0.0

- [smebberson/alpine-consul-base: v1.0.0][smebbersonalpineconsulbase100]
- [nginx][nginx]: v1.8.0

Usage: `smebberson/alpine-consul-nginx:1.0.0`.

[nginx]: http://nginx.org/
[alpineconsulnginx]: https://github.com/smebberson/docker-alpine/tree/master/alpine-consul-nginx
[smebbersonalpineconsulbase400]: https://github.com/smebberson/docker-alpine/tree/alpine-consul-base-v4.0.0/alpine-consul-base
[smebbersonalpineconsulbase200]: https://github.com/smebberson/docker-alpine/tree/alpine-consul-base-v2.0.0/alpine-consul-base
[smebbersonalpineconsulbase100]: https://github.com/smebberson/docker-alpine/tree/alpine-consul-base-v1.0.0/alpine-consul-base
