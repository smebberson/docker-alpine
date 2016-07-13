# alpine-consul-ui

A Docker image for running [Consul with UI][consul], based on Alpine Linux.
This image belongs to a suite of images [documented here][dockeralpine].

Image size is ~36.9 MB.

## Features

This image features:

- [Alpine Linux][alpinelinux]
- [s6][s6] and [s6-overlay][s6overlay]
- [consul][consul]

## Versions

- `2.0.0`, `latest` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-consul-ui-v2.0.0/alpine-consul-ui/Dockerfile)
- `1.0.0` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-consul-ui-v1.0.0/alpine-consul-ui/Dockerfile)

[See VERSIONS.md for image contents.](https://github.com/smebberson/docker-alpine/blob/master/alpine-consul-ui/VERSIONS.md)

## Usage

To use this image include `FROM smebberson/alpine-consul` at the top of your `Dockerfile`, or simply `docker run --name consul smebberson/alpine-consul`.

This container has been setup to automatically connect to a Consul cluster, created with a service name of `consul`. [Read more about it here](https://github.com/smebberson/docker-alpine/tree/master//alpine-consul).

## Example

An example of using this image can be found in [examples/user-consul-ui][example].

[dockeralpine]: https://github.com/smebberson/docker-alpine
[s6]: http://www.skarnet.org/software/s6/
[s6overlay]: https://github.com/just-containers/s6-overlay
[alpinelinux]: https://www.alpinelinux.org/
[consul]: https://consul.io/
[alpineconsul]: https://registry.hub.docker.com/u/smebberson/alpine-consul/
[example]: https://github.com/smebberson/docker-alpine/tree/master/examples/user-consul-ui
