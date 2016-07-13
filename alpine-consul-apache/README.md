# alpine-consul-apache

A Docker image for running [Apache][apache] with [Consul][consul], based on Alpine Linux.
This image belongs to a suite of images [documented here][dockeralpine].

## Features

This image features:

- [Alpine Linux][alpinelinux]
- [s6][s6] and [s6-overlay][s6overlay]
- [Apache][apache]
- [consul][consul]

## Versions

- `1.0.0` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/master/alpine-consul-apache/Dockerfile)

[See VERSIONS.md for image contents.](https://github.com/smebberson/docker-alpine/blob/master/alpine-consul-apache/VERSIONS.md)

## Usage

To use this image include `FROM smebberson/alpine-consul-apache` at the top of your `Dockerfile`, or simply `docker run -p 80:80 -p 443:443 --name apache smebberson/alpine-consul-apache`.

Aside from Consul, this image is the same as alpine-apache. Please [refer to usage documentation here](https://github.com/smebberson/docker-alpine/tree/master//alpine-apache#usage).

### Consul service registration

By default the file at `/etc/consul/conf.d/apache.json` will register an `apache` service, on port `80` with [Consul][consul]. It also registers a 5s health check that reports on the availability of the service. If you'd like to configure perhaps more ports, or change the health check in another way, create a new file that meets the requirements of a [Consul service definition][consulservicedef] and add it (in your Dockerfile) to your image, replacing the already existing `apache.json`.

## Example

An example of using this image can be found in [examples/user-consul-apache][example].

[alpinelinux]: https://www.alpinelinux.org/
[consul]: https://consul.io/
[s6]: http://www.skarnet.org/software/s6/
[s6overlay]: https://github.com/just-containers/s6-overlay
[apache]: https://httpd.apache.org/
[consulservicedef]: https://www.consul.io/docs/agent/services.html
[dockeralpine]: https://github.com/smebberson/docker-alpine
[example]: https://github.com/smebberson/docker-alpine/blob/master/examples/user-consul-apache/Dockerfile
