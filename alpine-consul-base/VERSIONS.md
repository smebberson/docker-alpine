# alpine-consul-base

This file contains all software versions, that correspond to a version of this image itself. Read more about the [alpine-consul-base image here][alpineconsulbase].

## Latest

[![ImageLayers Layers](https://img.shields.io/imagelayers/layers/smebberson/alpine-consul-base/latest.svg)]()
[![ImageLayers Size](https://img.shields.io/imagelayers/image-size/smebberson/alpine-consul-base/latest.svg)]()

Same as v3.0.0.

Usage: `smebberson/alpine-consul-base` or `smebberson/alpine-consul-base:latest`.

## v3.0.0

[![ImageLayers Layers](https://img.shields.io/imagelayers/layers/smebberson/alpine-consul-base/3.0.0.svg)]()
[![ImageLayers Size](https://img.shields.io/imagelayers/image-size/smebberson/alpine-consul-base/3.0.0.svg)]()

- [smebberson/alpine-consul: v2.0.0][alpineconsul200]
- [consul-template: v0.14.0][consultemplate]

Improvements:

- [alpine-consul][alpine-consul] has been updated (many improvements).

Usage: `smebberson/alpine-consul-base:3.0.0`.

## v2.0.0

[![ImageLayers Layers](https://img.shields.io/imagelayers/layers/smebberson/alpine-consul-base/2.0.0.svg)]()
[![ImageLayers Size](https://img.shields.io/imagelayers/image-size/smebberson/alpine-consul-base/2.0.0.svg)]()

- [smebberson/alpine-consul: v1.1.0][alpineconsul110]
- [consul-template: v0.14.0][consultemplate]

Improvements:

- consul-template was added.

__*Breaking changes*__:

- consul configuration directory is now located at `/etc/consul/conf.d/`

Usage: `smebberson/alpine-consul-base:2.0.0`.

## v1.1.0

[![ImageLayers Layers](https://img.shields.io/imagelayers/layers/smebberson/alpine-consul-base/1.1.0.svg)]()
[![ImageLayers Size](https://img.shields.io/imagelayers/image-size/smebberson/alpine-consul-base/1.1.0.svg)]()

- [smebberson/alpine-consul: v1.1.0][alpineconsul110]

Usage: `smebberson/alpine-consul-base:1.1.0`.

## v1.0.0

[![ImageLayers Layers](https://img.shields.io/imagelayers/layers/smebberson/alpine-consul-base/1.0.0.svg)]()
[![ImageLayers Size](https://img.shields.io/imagelayers/image-size/smebberson/alpine-consul-base/1.0.0.svg)]()

- [smebberson/alpine-consul: v1.0.0][alpineconsul100]

Usage: `smebberson/alpine-consul-base:1.0.0`.

[alpineconsulbase]: https://github.com/smebberson/docker-alpine/tree/master/alpine-consul-base
[alpineconsul]: https://github.com/smebberson/docker-alpine/tree/master/alpine-consul
[alpineconsul200]: https://github.com/smebberson/docker-alpine/tree/alpine-consul-v2.0.0/alpine-consul
[alpineconsul110]: https://github.com/smebberson/docker-alpine/tree/alpine-consul-v1.1.0/alpine-consul
[alpineconsul100]: https://github.com/smebberson/docker-alpine/tree/alpine-consul-v1.0.0/alpine-consul
[consultemplate]: https://github.com/hashicorp/consul-template
