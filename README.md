docker-alpine
=============

A vagrant image with an environment to build Docker containers running [Alpine linux][alpinelinux] and [s6][s6] process management (via [s6-overlay][s6overlay]).

## Containers

The following describes the containers that are available and there inheritance chain:

```
| alpine-base
├─ alpine-consul
|  ├─ alpine-consul-ui
|  ├─ alpine-consul-base
|  |  ├─ alpine-consul-nodejs
|  |  └─ alpine-consul-nginx
├─ alpine-nginx
|  └─ alpine-nginx-nodejs
├─ alpine-nodejs
├─ alpine-redis
```

### alpine-base

This image is the base for all containers. It contains Alpine Linux and s6 via s6-overlay. It is super small and does nothing else. It clocks in at a tiny 11.9 MB.

An example of inheriting from this container and running it [can be found here](https://github.com/smebberson/docker-alpine/tree/master/examples/user-alpine).

### alpine-consul

This image inherits from alpine-base and adds [Consul][consul] into the mix. By default, it's setup as a consul server (with a bootstrap-expect of 1), so it will need some customisation. [Read here](https://github.com/smebberson/docker-alpine/tree/master/alpine-consul) for more information. An example of inheriting from this container and running Consul [can be found here](https://github.com/smebberson/docker-alpine/tree/master/examples/user-consul).

### alpine-consul-base

This image inherits from alpine-consul and is designed specifically to be inherited from, to create other images which require a work Consul setup. Consul is setup to run in agent mode, it expects one linked container called `consul-agent` and will automatically join to that ip. [Read here](https://github.com/smebberson/docker-alpine/tree/master/alpine-consul-base) for more information.

### alpine-consul-nodejs

This image inherits from alpine-consul-base and is is perfect if you're looking to run a Node.js application within a Docker setup and wanting to benefit from Consul for service registration and discovery. [Read here](https://github.com/smebberson/docker-alpine/tree/master/alpine-consul-nodejs) for more information. An example of inheriting from this container and running a Node.js website [can be found here](https://github.com/smebberson/docker-alpine/tree/master/examples/user-consul-nodejs).

### alpine-consul-nginx

This image inherits from alpine-consul-base and is is perfect if you're looking to run Nginx within a Docker setup and wanting to benefit from Consul for service registration and discovery. [Read here](https://github.com/smebberson/docker-alpine/tree/master/alpine-consul-nginx) for more information. An example of inheriting from this container and running Nginx [can be found here](https://github.com/smebberson/docker-alpine/tree/master/examples/user-consul-nginx).

### alpine-consul-ui

The image inherits from alpine-consul, and is geared up to run the Consul Web UI.

There are some configuration options which can be [read here](https://github.com/smebberson/docker-alpine/tree/master/alpine-consul-ui). An example of inheriting from this container and running Consul [can be found here](https://github.com/smebberson/docker-alpine/tree/master/examples/user-consul-ui).

### alpine-nginx

This image inherits from alpine-base, and includes nginx with a very basic configuration. You can [read about using this image and customising it here](https://github.com/smebberson/docker-alpine/tree/master/alpine-nginx). An example of inheriting from this container and running Nginx [can be found here](https://github.com/smebberson/docker-alpine/tree/master/examples/user-nginx).

### alpine-nginx-nodejs

This image inherits from alpine-nginx, and includes nginx and Node.js. This image is great if you want run nginx, but have Node.js do all of the configuration for Nginx. You can [read about using this image and customising it here](https://github.com/smebberson/docker-alpine/tree/master/alpine-nginx-nodejs).

### alpine-nodejs

This image inherits from alpine-base, and includes Node.js. You can [read about using this image and customising it here](https://github.com/smebberson/docker-alpine/tree/master/alpine-nodejs). An example of inheriting from this container and running a Node.js script [can be found here](https://github.com/smebberson/docker-alpine/tree/master/examples/user-nodejs).

### alpine-redis

This image inherits from alpine-base, and includes Redis. You can [read about using this image and customising it here](https://github.com/smebberson/docker-alpine/tree/master/alpine-redis).

## Setup

Setup the vagrant machine by running `vagrant up --provider=vmware_fusion`. This will get you a VM running a pretty basic version of Ubuntu with:

- Docker (latest at the time of running vagrant up, for the first time).
- Installed packages `software-properties-common`, `build-essential`.

[alpinelinux]: https://www.alpinelinux.org/
[s6]: http://skarnet.org/software/s6/
[s6overlay]: https://github.com/just-containers/s6-overlay
[consul]: https://consul.io/
