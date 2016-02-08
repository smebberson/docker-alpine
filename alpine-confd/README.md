# alpine-confd

An image for using [confd][confd] within Docker containers.

This image is one of many Docker images designed to run multiple services per container (grouped sparingly and logically of course). You can read more about the philosophy of these images [here][dockeralpinedesign].

## Features

This image features:

- [Alpine Linux][alpinelinux]
- [s6][s6] and [s6-overlay][s6overlay]
- [confd][confd]

## Versions

- `1.0.2`, `latest` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/master/alpine-confd/Dockerfile)
- `1.0.1` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/b271a701b9beb019e667307072baa604d0383410/alpine-confd/Dockerfile)
- `1.0.0` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/e9c249f956d2ac3da74ad1cb0ee0e619d5395c2a/alpine-confd/Dockerfile)

[See VERSIONS.md for image contents.](https://github.com/smebberson/docker-alpine/blob/master/alpine-confd/VERSIONS.md)

## Usage

To use this image include `FROM smebberson/alpine-confd` at the top of your `Dockerfile`, or simply `docker run --name confd smebberson/alpine-confd`.

By default, this container doesn't actually do anything other than provide the building blocks for a Docker container that includes configuration management via confd.

## Customisation

This container is highly customisable and is built with customisation in mind. Take a look at [an example][alpineconfdexample] of using this image to configure a container at initialization stage.

For information about using s6 to start services, refer to [smebberson/alpine-base][alpinebase].

[s6]: http://www.skarnet.org/software/s6/
[s6overlay]: https://github.com/just-containers/s6-overlay
[confd]: https://github.com/kelseyhightower/confd
[alpinelinux]: http://www.alpinelinux.org/
[dockeralpinedesign]: https://github.com/smebberson/docker-alpine/blob/master/DESIGN.md
[alpineconfdexample]: https://github.com/smebberson/docker-alpine/blob/master/examples/user-confd/Dockerfile
[alpinebase]: https://github.com/smebberson/docker-alpine/tree/master/alpine-base
