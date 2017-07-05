# alpine-consul-base

A Docker image designed for extending from when you need to run [Consul][consul], based on Alpine Linux.
This image belongs to a suite of images [documented here][dockeralpine].

This image is designed to be extended from, with specific services added to it via Consul, along with appropriate health checks.

Image size is ~49.4 MB.

## Features

This image features:

- [Alpine Linux][alpinelinux]
- [s6][s6] and [s6-overlay][s6overlay]
- [Consul][consul] and [consul-template][consultemplate]

## Versions

- `4.2.0`, `latest` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-consul-base-v4.2.0/alpine-consul-base/Dockerfile)
- `4.1.1` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-consul-base-v4.1.1/alpine-consul-base/Dockerfile)
- `4.1.0` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-consul-base-v4.1.0/alpine-consul-base/Dockerfile)
- `4.0.0` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-consul-base-v4.0.0/alpine-consul-base/Dockerfile)
- `3.0.0` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-consul-base-v3.0.0/alpine-consul-base/Dockerfile)
- `2.0.0` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-consul-base-v2.0.0/alpine-consul-base/Dockerfile)
- `1.1.0` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-consul-base-v1.1.0/alpine-consul-base/Dockerfile)
- `1.0.0` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-consul-base-v1.0.0/alpine-consul-base/Dockerfile)

[See VERSIONS.md for image contents.](https://github.com/smebberson/docker-alpine/blob/master/alpine-consul-base/VERSIONS.md)

## Usage

To use this image include `FROM smebberson/alpine-consul-base` at the top of your `Dockerfile`, or simply `docker run --name consul-base smebberson/alpine-consul-base`.

This container has been setup to automatically connect to a Consul cluster, created with a service name of `consul`. [Read more about it here](https://github.com/smebberson/docker-alpine/tree/master//alpine-consul).

[consul-template][consultemplate] is automatically started if templates are available.

## Customisation

To use [consul-template][consultemplate]:

1. Add your templates to `root/etc/consul-template/templates/my-service/`.
1. Make `consul-template` configuration aware of your templates by adding a configuration file in `root/etc/consul-template/conf.d/my-service` (use sub folders to make `VOLUME /etc/consul-template/templates/my-service` possible).
1. In your `Dockerfile` be sure to run `mkfifo /etc/services.d/my-service/supervise/control` and `chmod g+w /etc/services.d/my-service/supervise/control` in order to make it possible for `consul-template` to restart the service if needed.

## Example

An example of using this image can be found in [examples/user-consul-nginx-nodejs][example].

[alpinelinux]: https://www.alpinelinux.org/
[consul]: https://consul.io/
[s6]: http://www.skarnet.org/software/s6/
[s6overlay]: https://github.com/just-containers/s6-overlay
[apache]: https://httpd.apache.org/
[consulservicedef]: https://www.consul.io/docs/agent/services.html
[dockeralpine]: https://github.com/smebberson/docker-alpine
[consultemplate]: https://github.com/hashicorp/consul-template
[example]: https://github.com/smebberson/docker-alpine/tree/master/examples/user-consul-nginx-nodejs
