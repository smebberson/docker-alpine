# alpine-consul-nginx-nodejs

A Docker image for running [nginx][nginx] with [Node.js][nodejs] and [Consul][consul], based on Alpine Linux.
This image belongs to a suite of images [documented here][dockeralpine].

## Features

This image features:

- [Alpine Linux][alpinelinux]
- [s6][s6] and [s6-overlay][s6overlay]
- [nginx][nginx]
- [Node.js][nodejs]
- [consul][consul]

## Versions

- `2.0.0`, `latest` [(Dockerfile)](https://github.com/smebberson/docker-alpine/tree/alpine-consul-nginx-v2.0.0/alpine-consul-nginx-nodejs/Dockerfile)
- `1.0.0` [(Dockerfile)](https://github.com/smebberson/docker-alpine/tree/alpine-consul-nginx-v1.0.0/alpine-consul-nginx-nodejs/Dockerfile)

[See VERSIONS.md for image contents.](https://github.com/smebberson/docker-alpine/blob/master/alpine-consul-nginx-nodejs/VERSIONS.md)

## Usage

This container has been setup to automatically connect to a Consul cluster, created with a service name of `consul`. [Read more about it here](https://github.com/smebberson/docker-alpine/tree/master//alpine-consul).

This is just a combination of [smebberson/alpine-consul-nginx][alpineconsulnginx] and [smebberson/alpine-consul-nodejs][alpineconsulnodejs] containers. Read their individual documentation for usage guidelines.

## Example

An example of using this image can be found in [examples/user-consul-nginx-nodejs][example].

[dockeralpine]: https://github.com/smebberson/docker-alpine
[s6]: http://www.skarnet.org/software/s6/
[s6overlay]: https://github.com/just-containers/s6-overlay
[alpinelinux]: https://www.alpinelinux.org/
[consul]: https://consul.io/
[alpineconsulnginx]: https://github.com/smebberson/docker-alpine/tree/master/alpine-consul-nginx
[alpineconsulnodejs]: https://github.com/smebberson/docker-alpine/tree/master/alpine-consul-nodejs
[example]: https://github.com/smebberson/docker-alpine/tree/master/examples/user-consul-nginx-nodejs
[nodejs]: https://nodejs.org/
[nginx]: http://nginx.org/
