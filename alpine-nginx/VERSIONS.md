alpine-nginx
============

This file contains all software versions, that correspond to a version of this image itself.

## Latest

Same as v2.1.1.

Usage: `smebberson/alpine-nginx` or `smebberson/alpine-nginx:latest`.

## v2.1.1

- [smebberson/alpine-base: v1.2.0][smebbersonalpinebase120]
- [nginx][nginx]: v1.8.0

Improvements:

- Updates `finish` script to latest best practice for bringing down a container on crash.

Usage: `smebberson/alpine-nginx:2.1.1`.

## v2.1.0

- [smebberson/alpine-base: v1.2.0][smebbersonalpinebase120]
- [nginx][nginx]: v1.8.0

Usage: `smebberson/alpine-nginx:2.1.0`.

## v2.0.0

- [smebberson/alpine-base: v1.1.0][smebbersonalpinebase110]
- [nginx][nginx]: v1.8.0
- *breaking change*: nginx logs are now located at `/var/log/nginx/access.log` and `/var/log/nginx/error.log`

Usage: `smebberson/alpine-nginx:2.0.0`.

## v1.0.0

- [smebberson/alpine-base: v1.0.0][smebbersonalpinebase100]
- [nginx][nginx]: v1.8.0

Usage: `smebberson/alpine-nginx:1.0.0`.

[nginx]: http://nginx.org/
[smebbersonalpinebase100]: https://github.com/smebberson/docker-alpine/blob/fdb9fca74d03ee1b21e47e3edd54f01cb4bf5ab6/alpine-base/Dockerfile
[smebbersonalpinebase110]: https://github.com/smebberson/docker-alpine/blob/1f0d03677e8ebbcd59ff8209730089bcac79d23d/alpine-base/Dockerfile
[smebbersonalpinebase120]: https://github.com/smebberson/docker-alpine/blob/1f0d03677e8ebbcd59ff8209730089bcac79d23d/alpine-base/Dockerfile
