# alpine-consul

A Docker image for running [consul][consul], based on Alpine Linux.
This image belongs to a suite of images [documented here][dockeralpine].

Image size is ~36.9 MB.

## Features

This image features:

- [Alpine Linux][alpinelinux]
- [s6][s6] and [s6-overlay][s6overlay]
- [consul][consul]

## Versions

- `3.0.0`, `latest` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-consul-v3.0.0/alpine-consul/Dockerfile)
- `2.0.0` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-consul-v2.0.0/alpine-consul/Dockerfile)
- `1.1.0` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-consul-v1.1.0/alpine-consul/Dockerfile)
- `1.0.0` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-consul-v1.0.0/alpine-consul/Dockerfile)

[See VERSIONS.md for image contents.](https://github.com/smebberson/docker-alpine/blob/master/alpine-consul/VERSIONS.md)

## Usage

To use this image include `FROM smebberson/alpine-consul` at the top of your `Dockerfile`, or simply `docker run --name consul smebberson/alpine-consul`.

By default, Consul has been configured with [zero-conf Consul bootstrapping](https://github.com/smebberson/docker-alpine/tree/master/#consul-and-service-discovery) (to take advantage of zero-conf Consul bootstrapping, Docker 1.10+ is required).

To use this image to setup a Consul cluster with 3 nodes via Docker Compose, add the following to your `docker-compose.yml` file:

```
version: '2'

services:
    consul:
        image: smebberson/alpine-consul:dev
```

Then start with `dc up -d && dc scale consul=3`. You don't need to worry about bootstrapping the Consul cluster, everything just works.

## Customisation

This container comes setup as follows:

- Consul will automatically start.
- If Consul dies, it will automatically be restarted (the container will remain running).

All configuration has been defined in the `root/etc/consul/conf.d/bootstrap/config.json` file.

To customise configuration for `consul`, replace the file at `root/etc/consul/conf.d/bootstrap/config.json` with your own configuration.

To customise the start script for `consul`, replace the file at `root/etc/services.d/consul/run` with your own start script.

### Consul DNS domain

By default, Consul's DNS domain is `consul.`. This allows you to make DNS queries such as `nginx.service.consul` to find all IPs relating to the `nginx` service (for example). Through customizing the environment variable `CONSUL_DOMAIN` you can alter Consul's DNS domain.

For example, add `ENV CONSUL_DOMAIN=dockeralpine` to your `Dockerfile` and you'll be able to make a DNS query for `nginx.service.dockeralpine` rather than the default.

You can read more about [Consul's DNS interface here][consuldnsinterface].

## Example

An example of using this image can be found in [examples/user-confd][example].

[dockeralpine]: https://github.com/smebberson/docker-alpine
[alpinelinux]: http://www.alpinelinux.org/
[s6]: http://www.skarnet.org/software/s6/
[s6overlay]: https://github.com/just-containers/s6-overlay
[consul]: https://www.consul.io/
[alpinebase]: https://registry.hub.docker.com/u/smebberson/alpine-base/
[consului]: https://github.com/smebberson/docker-ubuntu-base/tree/master/consul-ui
[consulagent]: https://github.com/smebberson/docker-ubuntu-base/tree/master/consul-agent
[consuldnsinterface]: https://www.consul.io/docs/agent/dns.html
[example]: https://github.com/smebberson/docker-alpine/blob/master/examples/user-consul/Dockerfile
