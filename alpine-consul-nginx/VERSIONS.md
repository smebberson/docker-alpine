# alpine-consul-nginx

This file contains all software versions, that correspond to a version of this image itself. Read more about the [alpine-consul-nginx image here][alpineconsulnginx].

## Latest

Same as v2.0.0.

Usage: `smebberson/alpine-consul-nginx` or `smebberson/alpine-consul-nginx:latest`.

## v2.0.0

- [smebberson/alpine-consul-base: v2.0.0][smebbersonalpineconsulbase200]
- [nginx][nginx]: v1.8.1
- *breaking change*: consul configuration directory is now located at `/etc/consul/conf.d/`

Usage: `smebberson/alpine-consul-nginx:1.1.0`.

## v1.0.0

- [smebberson/alpine-consul-base: v1.0.0][smebbersonalpineconsulbase100]
- [nginx][nginx]: v1.8.0

Usage: `smebberson/alpine-consul-nginx:1.0.0`.

[nginx]: http://nginx.org/
[alpineconsulnginx]: https://github.com/smebberson/docker-alpine/tree/master/alpine-consul-nginx
[smebbersonalpineconsulbase200]: https://github.com/smebberson/docker-alpine/tree/alpine-consul-base-v2.0.0/alpine-consul-base
[smebbersonalpineconsulbase100]: https://github.com/smebberson/docker-alpine/tree/alpine-consul-base-v1.0.0/alpine-consul-base
