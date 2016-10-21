# alpine-base

A Docker image for running just about anything within a container, based on Alpine Linux.
This image belongs to a suite of images [documented here][dockeralpine].

Image size is ~13.8 MB.

## Features

This image features:

- [Alpine Linux][alpinelinux]
- [s6][s6] and [s6-overlay][s6overlay]
- [go-dnsmasq][godnsmasq]

## Versions

- `3.1.0`, `latest` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-base-v3.0.1/alpine-base/Dockerfile)
- `3.0.0` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-base-v3.0.0/alpine-base/Dockerfile)
- `2.0.0` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-base-v2.0.0/alpine-base/Dockerfile)
- `1.2.1` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-base-v1.2.1/alpine-base/Dockerfile)
- `1.2.0` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-base-v1.2.0/alpine-base/Dockerfile)
- `1.1.0` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-base-v1.1.0/alpine-base/Dockerfile)
- `1.0.0` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-base-v1.0.0/alpine-base/Dockerfile)

[See VERSIONS.md for image contents.](https://github.com/smebberson/docker-alpine/blob/master/alpine-base/VERSIONS.md)

## Usage

To use this image include `FROM smebberson/alpine-base` at the top of your `Dockerfile`. Starting from `smebberson/alpine-base` provides you with the ability to easily start any service using s6. s6 will also keep it running for you, restarting it when it crashes.

[Read more about extending this image with your own services](https://github.com/smebberson/docker-alpine/tree/master/#using-services).

### DNS

Prior to v4.4, Alpine Linux did not support the `search` keyword in `resolv.conf`. This breaks many tools that rely on DNS service discovery, in particular, Kubernetes, Docker Cloud, Consul, Rancher.

To overcome these issues, `alpine-base` includes the lightweight container-only DNS server [go-dnsmasq][godnsmasq] to resolve these issues.

That means that any image extending this image will now work with [Docker Cloud service discovery and links](https://docs.docker.com/docker-cloud/apps/service-links/) and [Kubernetes service discovery](https://github.com/kubernetes/kubernetes/blob/master/docs/user-guide/services.md#dns).

**Note**: despite Alpine Linux v4.4 adding support for the `search` keyword, `go-dnsmasq` has been retained for compatibility. It may or may not be included in future versions.

## Example

An example of using this image can be found in [examples/user-alpine](alpinebaseexample).

[alpinebaseexample]: https://github.com/smebberson/docker-alpine/tree/master/examples/user-alpine
[godnsmasq]: https://github.com/janeczku/go-dnsmasq
[dockeralpine]: https://github.com/smebberson/docker-alpine
