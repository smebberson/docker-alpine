docker-alpine
=============

A vagrant image with an environment to build Docker containers running [Alpine linux][alpinelinux] and [s6][s6] process management (via [s6-overlay][s6overlay]).

Read more about the [design of the Docker images][dockeralpinedesign] and how they help to make process management within Docker containers quick and simple.

Support for the DNS `search` keyword has also been added such that although all images within this repository use Alpine Linux, they also [all support the DNS `search` keyword][alpinebasedns].

## Containers

The following describes the containers that are available and the inheritance chain:

```
├─ alpine-base
|  ├─ alpine-apache
|  ├─ alpine-confd
|  |  └─ alpine-rabbitmq
|  ├─ alpine-consul
|  |  ├─ alpine-consul-ui
|  |  ├─ alpine-consul-base
|  |  |  ├─ alpine-consul-apache
|  |  |  ├─ alpine-consul-nodejs
|  |  |  ├─ alpine-consul-nginx
|  |  |  |  └─ alpine-consul-nginx-nodejs
|  |  |  └─ alpine-consul-redis
|  ├─ alpine-nginx
|  |  └─ alpine-nginx-nodejs
|  ├─ alpine-nodejs
|  └─ alpine-redis
```

### alpine-base

This image is the base for all containers. It contains Alpine Linux (with DNS `search` support) and s6 via s6-overlay. It is super small and does nothing else. It clocks in at a tiny 14.3 MB.

An example of inheriting from this container and running it [can be found here](https://github.com/smebberson/docker-alpine/tree/master/examples/user-alpine).

Latest version is `1.3.0`, or `latest` ([VERSIONS.md](https://github.com/smebberson/docker-alpine/blob/master/alpine-base/VERSIONS.md)).

### alpine-apache

This image inherits from alpine-base, and includes apache with a very basic configuration. You can [read about using this image and customising it here](https://github.com/smebberson/docker-alpine/tree/master/alpine-apache). An example of inheriting from this container and running Apache [can be found here](https://github.com/smebberson/docker-alpine/tree/master/examples/user-apache).

Latest version is `1.0.0`, or `latest` ([VERSIONS.md](https://github.com/smebberson/docker-alpine/blob/master/alpine-apache/VERSIONS.md)).

### alpine-confd

This image inherits from alpine-base and adds [confd][confd] into the mix. This image should be seen as a base image which should be used for heavy customisation. It's quite lean featuring only Alpine Linux, s6 and confd. [Read here](https://github.com/smebberson/docker-alpine/tree/master/alpine-confd) for more information. An example of inheriting from this container and running Consul [can be found here](https://github.com/smebberson/docker-alpine/tree/master/examples/user-confd).

Latest version is `1.0.2`, or `latest` ([VERSIONS.md](https://github.com/smebberson/docker-alpine/blob/master/alpine-confd/VERSIONS.md)).

### alpine-consul

This image inherits from alpine-base and adds [Consul][consul] into the mix. By default, it's setup as a consul server (with a bootstrap-expect of 1), so it will need some customisation. [Read here](https://github.com/smebberson/docker-alpine/tree/master/alpine-consul) for more information. An example of inheriting from this container and running Consul [can be found here](https://github.com/smebberson/docker-alpine/tree/master/examples/user-consul).

Latest version is `1.1.0`, or `latest` ([VERSIONS.md](https://github.com/smebberson/docker-alpine/blob/master/alpine-consul/VERSIONS.md)).

### alpine-consul-base

This image inherits from alpine-consul and is designed specifically to be inherited from, to create other images which require a work Consul setup. Consul is setup to run in agent mode, it expects one linked container called `consul-agent` and will automatically join to that ip. [Read here](https://github.com/smebberson/docker-alpine/tree/master/alpine-consul-base) for more information.

Latest version is `1.0.0`, or `latest` ([VERSIONS.md](https://github.com/smebberson/docker-alpine/blob/master/alpine-consul-base/VERSIONS.md)).

### alpine-consul-apache

This image inherits from alpine-consul-base and is perfect if you're looking to run Apache within a Docker setup and wanting to benefit from Consul for service registration and discovery. [Read here](https://github.com/smebberson/docker-alpine/tree/master/alpine-consul-apache) for more information. An example of inheriting from this container and running apache [can be found here](https://github.com/smebberson/docker-alpine/tree/master/examples/user-consul-apache).

Latest version is `1.0.0`, or `latest` ([VERSIONS.md](https://github.com/smebberson/docker-alpine/blob/master/alpine-consul-apache/VERSIONS.md)).

### alpine-consul-nodejs

This image inherits from alpine-consul-base and is perfect if you're looking to run a Node.js application within a Docker setup and wanting to benefit from Consul for service registration and discovery. [Read here](https://github.com/smebberson/docker-alpine/tree/master/alpine-consul-nodejs) for more information. An example of inheriting from this container and running a Node.js website [can be found here](https://github.com/smebberson/docker-alpine/tree/master/examples/user-consul-nodejs).

### alpine-consul-nginx

This image inherits from alpine-consul-base and is perfect if you're looking to run Nginx within a Docker setup and wanting to benefit from Consul for service registration and discovery. [Read here](https://github.com/smebberson/docker-alpine/tree/master/alpine-consul-nginx) for more information. An example of inheriting from this container and running nginx [can be found here](https://github.com/smebberson/docker-alpine/tree/master/examples/user-consul-nginx).

Latest version is `1.0.0`, or `latest` ([VERSIONS.md](https://github.com/smebberson/docker-alpine/blob/master/alpine-consul-nginx/VERSIONS.md)).

### alpine-consul-nginx-nodejs

This image inherits from alpine-consul-nginx and is perfect if you're looking to run nginx to proxy to a Node.js application, or if you're wanting to run nginx as a load balancer (proxying to external containers) and using Node.js for nginx configuration. [Read here](https://github.com/smebberson/docker-alpine/tree/master/alpine-consul-nginx-nodejs) for more information. An example of inheriting from this container and running nginx with Node.js [can be found here](https://github.com/smebberson/docker-alpine/tree/master/examples/user-consul-nginx-nodejs).

### alpine-consul-redis

This image inherits from alpine-consul-base and provides a Redis container benefiting from Consul for service registration and discovery. [Read here](https://github.com/smebberson/docker-alpine/tree/master/alpine-consul-redis) for more information. An example of inheriting from this container [can be found here](https://github.com/smebberson/docker-alpine/tree/master/examples/user-consul-redis).

### alpine-consul-ui

The image inherits from alpine-consul, and is geared up to run the Consul Web UI.

There are some configuration options which can be [read here](https://github.com/smebberson/docker-alpine/tree/master/alpine-consul-ui). An example of inheriting from this container and running Consul [can be found here](https://github.com/smebberson/docker-alpine/tree/master/examples/user-consul-ui).

### alpine-nginx

This image inherits from alpine-base, and includes nginx with a very basic configuration. You can [read about using this image and customising it here](https://github.com/smebberson/docker-alpine/tree/master/alpine-nginx). An example of inheriting from this container and running Nginx [can be found here](https://github.com/smebberson/docker-alpine/tree/master/examples/user-nginx).

Latest version is `2.1.1`, or `latest` ([VERSIONS.md](https://github.com/smebberson/docker-alpine/blob/master/alpine-nginx/VERSIONS.md)).

### alpine-nginx-nodejs

This image inherits from alpine-nginx, and includes nginx and Node.js. This image is great if you want run nginx, but have Node.js do all of the configuration for Nginx. You can [read about using this image and customising it here](https://github.com/smebberson/docker-alpine/tree/master/alpine-nginx-nodejs).

An example of inheriting from this container and running it [can be found here](https://github.com/smebberson/docker-alpine/tree/master/examples/user-nginx-nodejs).

Latest version is `2.1.1`, or `latest` ([VERSIONS.md](https://github.com/smebberson/docker-alpine/blob/master/alpine-nginx-nodejs/VERSIONS.md)).

### alpine-nodejs

This image inherits from alpine-base, and includes Node.js. You can [read about using this image and customising it here](https://github.com/smebberson/docker-alpine/tree/master/alpine-nodejs). An example of inheriting from this container and running a Node.js script [can be found here](https://github.com/smebberson/docker-alpine/tree/master/examples/user-nodejs).

Latest version is `3.0.1`, or `latest` ([VERSIONS.md](https://github.com/smebberson/docker-alpine/blob/master/alpine-nodejs/VERSIONS.md)).

### alpine-rabbitmq

This image inherits from alpine-confd, and includes [RabbitMQ][rabbitmq]. You can [read about using this image and customising it here](https://github.com/smebberson/docker-alpine/tree/master/alpine-rabbitmq).

Latest version is `1.0.0`, or `latest` ([VERSIONS.md](https://github.com/smebberson/docker-alpine/blob/master/alpine-rabbitmq/VERSIONS.md)).

### alpine-redis

This image inherits from alpine-base, and includes Redis. You can [read about using this image and customising it here](https://github.com/smebberson/docker-alpine/tree/master/alpine-redis).

## Versioning

Each image has it's own version and will be updated independently. All versions follow [semver](semver). If a software package or the operating system the image uses is updated, the level of update will be reflected in the new version number, for example:

- if Alpine Linux is upgraded from 3.2 to 3.3, then the image version will receive a minor increment
- if Alpine Linux is upgraded from 3.3 to 4, then the image version will receive a major increment
- if s6-overlay is upgraded to the latest patch upgrade, and nginx is upgraded to the latest minor upgrade, then the image version will will receive a minor increment

## Setup

Setup the vagrant machine by running `vagrant up --provider=vmware_fusion`. This will get you a VM running a pretty basic version of Ubuntu with:

- Docker (latest at the time of running vagrant up, for the first time).
- Installed packages `software-properties-common`, `build-essential`.

[alpinelinux]: https://www.alpinelinux.org/
[s6]: http://skarnet.org/software/s6/
[s6overlay]: https://github.com/just-containers/s6-overlay
[consul]: https://consul.io/
[semver]: http://semver.org/
[confd]: https://github.com/kelseyhightower/confd
[dockeralpinedesign]: https://github.com/smebberson/docker-alpine/blob/master/DESIGN.md
[alpinebasedns]: https://github.com/smebberson/docker-alpine/tree/master/alpine-base#dns
[rabbitmq]: http://www.rabbitmq.com/
