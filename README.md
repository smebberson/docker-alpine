# docker-alpine

Highly configurable Docker images running [Alpine linux][alpinelinux] and [s6][s6] process management.

[Jump to the list of images in this repository](#images).

**Table of contents**

- [Goals](#goals)
- [Docker and microservices](#docker-and-microservices)
- [Image design](#image-design)
- [Consul and service discovery](#consul-and-service-discovery)
- [Examples](#example)
- [Images](#images)
- [Customization](#customization)
- [FAQ](#faq)
- [Versioning](#versioning)
- [Contributing](#contributing)
- [Contributors](#contributors)

## Goals

This project has the following goals:

- To produce small Docker images.
- To provide Docker images that are easily configurable.
- To provide Docker images that are highly stable.
- To quickly enable a microservices architecture using Docker.

## Docker and microservices

Using Docker makes your infrastructure and environment consistent, testable, scalable and repeatable.

### What are microservices?

Microservices are isolated components (of a whole) doing one thing, and doing it well. These microservices are pulled together to provide a complete platform. For example, each of the following microservices would exist within one Docker container:

- A stateless web application running in Node.js.
- Session data for the Node.js web application provided by Redis.
- MongoDB as the database for the Node.js web application.
- Nginx web server proxying requests to Node.js.

### How do they talk to each other?

That's called service discovery. We solve that problem using Consul (which is a distributed service discovery tool, with built-in health checks). Each container advertises their service (IP and port) via Consul.

Each container with a service, connects to a member of the Consul cluster. Consul then _talks_ to all members to enable service discovery via HTTP and DNS.

A good example is a container with Nginx that will query Consul for the IP address of the Node.js container so that it can proxy an incoming request through to the Node.js application.

### What about scalability?

Setting up your infrastructure using microservices makes scalability a breeze.

[There is an example](examples/complete/README.md) showing Nginx load balancing incoming requests to multiple Node.js containers.

## Image design

These images are used heavily in production by a number of different companies. They've been designed as great starting points to easily customize and use within your own platforms.

### Core components

The following are common to all images within this repository.

#### Alpine Linux

Alpine Linux provides the foundation for all images in this repository. It's small, fast and perfect for Docker.

#### s6

s6 is a unix service supervisor (much like runit and supervisord only better).

While it's true that Docker containers should have one clear focus, more often than not, you'll need to run multiple processes within the container.

Consul is a great example; you need the Consul agent to join a Consul cluster and the primary service such as Nginx or Node.js. Log management is also a key consideration in which another process might need to run.

#### s6-overlay

s6-overlay is s6 Dockerized! It makes working with Docker and process management via s6 super easy. It also features some really nice extras such as container initialization and finalization stages (run custom scripts during these phases to setup services or tidy up from crashes).

#### go-dnsmasq

go-dnsmasq has been added into the mix to add support for the DNS `search` keyword which doesn't come standard in Alpine Linux.

These images work well with the embedded DNS service that comes with Docker 1.10+.

### Configuration

Configuration is a key step within a Docker-based microservices architecture. You must configure your services to interact with each other.

All Consul-based images come with `consul-template` for easy configuration based on changes within Consul.

All non-Consul-based images come with `confd`.

## Consul and service discovery

All Consul-related containers have been design for use in production and development.

These containers have been configured for zero-conf Consul bootstrapping. To achieve this, `docker-engine` v1.10+ is required. along with a `docker-compose.yml` file written in the version `2` format.

To achieve zero-conf Consul bootstrapping, Docker's new embedded DNS server is used within each container to find the IP of a consul container (**note**: there is a requirement that all Consul server services in `docker-compose.yml` are called `consul` for this to work).

**Note:**: this can work in older versions of Docker however (using service links with the name consul).

### Crashes and restarts.

The Consul-based images in this repository have been designed to meet the following requirements:

Containers running Consul in server mode:

- When Consul dies: kill the container immediately.
- When Consul starts: remove all data associated with Consul so everything starts afresh.

Containers running Consul in agent mode:

- When Consul dies: immediately restart it using s6.
- When Consul starts: it will use the Consul data previously create to quickly rejoin a cluster.
- When the primary service dies: kill the container immediately.

We've found this to be the most consistent way to effectively run Consul in production. This also supports the development workflow in which you `CTRL+C` to stop a container from running.

## Examples

Most images have an example in the [examples folder](examples/).

There is also a complete example which demonstrates:

- Zero-configuration Consul bootstrapping.
- Stateless application.
- Load balanced Nginx proxies.
- Scaled web application.

You can read more about the [example](examples/complete/README.md).

## Images

The following describes the images that are available and the inheritance chain.

### Images without Consul

```
└─ alpine-base
   ├─ alpine-apache
   ├─ alpine-confd
   |  └─ alpine-rabbitmq
   ├─ alpine-nginx
   |  └─ alpine-nginx-nodejs
   ├─ alpine-nodejs
   └─ alpine-redis
```

### Images with Consul

```
└─ alpine-base
   └─ alpine-consul
      ├─ alpine-consul-ui
      └─ alpine-consul-base
         ├─ alpine-consul-apache
         ├─ alpine-consul-nodejs
         ├─ alpine-consul-nginx
         |  └─ alpine-consul-nginx-nodejs
         └─ alpine-consul-redis
```

### alpine-base

This image is the base for all containers. All other Docker images within this repository inherit from this Container.

Latest version is `2.0.0`, or `latest`.

- [README.md](https://github.com/smebberson/docker-alpine/blob/master/alpine-base/README.md)
- [VERSIONS.md](https://github.com/smebberson/docker-alpine/blob/master/alpine-base/VERSIONS.md)

### alpine-apache

This image includes Apache HTTPD with a very basic configuration.

Latest version is `2.0.0`, or `latest`.

- [README.md](https://github.com/smebberson/docker-alpine/blob/master/alpine-apache/README.md)
- [VERSIONS.md](https://github.com/smebberson/docker-alpine/blob/master/alpine-apache/VERSIONS.md)

### alpine-confd

This image adds [confd][confd]. It should be seen as a base image suitable for heavy customisation.

Latest version is `2.0.0`, or `latest`.

- [VERSIONS.md](https://github.com/smebberson/docker-alpine/blob/master/alpine-confd/VERSIONS.md)
- [README.md](https://github.com/smebberson/docker-alpine/blob/master/alpine-confd/README.md)

### alpine-consul

This image adds [Consul][consul].

If you want to create a Docker image to run as a Consul agent in server mode (i.e. part of a cluster) start with this image.

Latest version is `2.0.0`, or `latest`.

- [README.md](https://github.com/smebberson/docker-alpine/blob/master/alpine-consul/README.md)
- [VERSIONS.md](https://github.com/smebberson/docker-alpine/blob/master/alpine-consul/VERSIONS.md)

### alpine-consul-base

This image inherits from `alpine-consul` and is designed as a base image for other Docker images which will join to a Consul cluster.

If you want to create a Docker image to advertise a service in Consul start with this image.

Latest version is `3.0.0`, or `latest`.

- [README.md](https://github.com/smebberson/docker-alpine/blob/master/alpine-consul-base/README.md)
- [VERSIONS.md](https://github.com/smebberson/docker-alpine/blob/master/alpine-consul-base/VERSIONS.md)

### alpine-consul-apache

This image is designed to run Apache within the context of service discovery (via Consul).

It is suited to running Apache as a proxy to another Docker container.

Latest version is `1.0.0`, or `latest`.

- [README.md](https://github.com/smebberson/docker-alpine/blob/master/alpine-consul-apache/README.md)
- [VERSIONS.md](https://github.com/smebberson/docker-alpine/blob/master/alpine-consul-apache/VERSIONS.md)

### alpine-consul-nodejs

This image is designed to run a Node.js application within the context of service discovery (via Consul).

Latest version is `3.0.0`, or `latest`.

- [README.md](https://github.com/smebberson/docker-alpine/blob/master/alpine-consul-nodejs/README.md)
- [VERSIONS.md](https://github.com/smebberson/docker-alpine/blob/master/alpine-consul-nodejs/VERSIONS.md)

### alpine-consul-nginx

This image is designed to run Nginx within the context of service discovery (via Consul).

It's suited for running an Nginx proxy or to load balance with Nginx to another container.

Latest version is `2.0.0`, or `latest`.

- [README.md](https://github.com/smebberson/docker-alpine/blob/master/alpine-consul-nginx/README.md)
- [VERSIONS.md](https://github.com/smebberson/docker-alpine/blob/master/alpine-consul-nginx/VERSIONS.md)

### alpine-consul-nginx-nodejs

This image is designed to run both Nginx and Node.js on the same container. It's a shortcut to running `alpine-consul-nodejs` via a proxy from `alpine-consul-nodejs`.

Latest version is `2.0.0`, or `latest`.

- [README.md](https://github.com/smebberson/docker-alpine/blob/master/alpine-consul-nginx-nodejs/README.md)
- [VERSIONS.md](https://github.com/smebberson/docker-alpine/blob/master/alpine-consul-nginx-nodejs/VERSIONS.md)

### alpine-consul-redis

This image has been designed to run Redis within the context of service discovery (via Consul).

Latest version is `1.0.0`, or `latest`.

- [README.md](https://github.com/smebberson/docker-alpine/blob/master/alpine-consul-redis/README.md)
- [VERSIONS.md](https://github.com/smebberson/docker-alpine/blob/master/alpine-consul-redis/VERSIONS.md)

### alpine-consul-ui

This image has been designed to connect to a Consul cluster (from `alpine-consul`) and make the Consul admin UI accessible.

Latest version is `1.0.0`, or `latest`.

- [README.md](https://github.com/smebberson/docker-alpine/blob/master/alpine-consul-ui/README.md)
- [VERSIONS.md](https://github.com/smebberson/docker-alpine/blob/master/alpine-consul-ui/VERSIONS.md)

### alpine-nginx

This image includes Nginx with a very basic setup.

Latest version is `2.1.1`, or `latest`.

- [README.md](https://github.com/smebberson/docker-alpine/blob/master/alpine-nginx/README.md)
- [VERSIONS.md](https://github.com/smebberson/docker-alpine/blob/master/alpine-nginx/VERSIONS.md)

### alpine-nginx-nodejs

This image includes both Nginx and Node.js. It's suitable if you want to have Node.js perform configuration for Nginx.

Latest version is `2.1.1`, or `latest`.

- [README.md](https://github.com/smebberson/docker-alpine/blob/master/alpine-nginx-nodejs/README.md)
- [VERSIONS.md](https://github.com/smebberson/docker-alpine/blob/master/alpine-nginx-nodejs/VERSIONS.md)

### alpine-nodejs

This includes Node.js.

Latest version is `3.1.0`, or `latest`.

- [README.md](https://github.com/smebberson/docker-alpine/blob/alpine-nodejs-v3.1.0/alpine-nodejs/README.md)
- [VERSIONS.md](https://github.com/smebberson/docker-alpine/blob/alpine-nodejs-v3.1.0/alpine-nodejs/VERSIONS.md)

### alpine-rabbitmq

This image inherits from `alpine-confd`, and includes [RabbitMQ][rabbitmq] with a basic setup.

Latest version is `2.1.1`, or `latest`.

- [README.md](https://github.com/smebberson/docker-alpine/blob/master/alpine-rabbitmq/README.md)
- [VERSIONS.md](https://github.com/smebberson/docker-alpine/blob/master/alpine-rabbitmq/VERSIONS.md)

### alpine-redis

This image includes Redis.

Latest version is `1.0.0`, or `latest`.

- [README.md](https://github.com/smebberson/docker-alpine/blob/master/alpine-redis/README.md)
- [VERSIONS.md](https://github.com/smebberson/docker-alpine/blob/master/alpine-redis/VERSIONS.md)

## Customization

The docker-alpine images are highly customizable. You can customize them with the following:

- Setting ENV variables to change settings.
- Overwrite a configuration file (not all images have these) to alter an application.
- Overwrite run scripts to change application start process.

They've also been designed so that it's easy to use these images in a non-standard context such as Docker Cloud and Rancher.

The following cover customization that is common to all images. Review the documentation for each image for image-specific customization options.

### `/usr/bin/host-ip`

This file is used in other scripts to determine the IP of the container in which a script is running.

Overwrite it as required to produce a correct value for your environment. Review the file itself for output requirements.

If your environment uses an overlay network (Docker Cloud, Rancher), you should change this file.

### `/usr/bin/container-find`

This file is used within other scripts to determine the IP address(es) of other containers by name.

By default, it uses `dig` to DNS query for the IP address of a container by name. `container-find` will DNS query for `consul` (the default). `container-find static` will DNS query for `static`. `container-find static.service.consul` will hand-off the DNS query to Consul.

## FAQ

These containers are a little different from your standard Docker image. The following should explain most of the differences.

### Where is Bash?

These images don't contain Bash by default. They're defaulted to use `sh`.

You can either write your scripts such that they're posix compliant or install Bash with `apk add --no-cache bash`.

### Where is my environment?

By default, `sh` has no environment. If you need access to environment variables in scripts or when using `docker exec` you should use:

- `#!/usr/bin/with-contenv sh`
- `docker exec -it complete_consul_1 with-contenv`

### Setting environment variables.

There are two ways to set environment variables. In your `Dockerfile` like any other containers or from within a custom script using `set-contenv` for example `set-contenv VAR_NAME var_value`.

## Versioning

Each image has it's own version and will be updated independently. All versions follow [semver](semver). If a software package or the operating system the image uses is updated, the level of update will be reflected in the new version number, for example:

- if Alpine Linux is upgraded from 3.2 to 3.3, then the image version will receive a minor increment
- if Alpine Linux is upgraded from 3.3 to 4, then the image version will receive a major increment
- if s6-overlay is upgraded to the latest patch upgrade, and nginx is upgraded to the latest minor upgrade, then the image version will will receive a minor increment

[alpinelinux]: https://www.alpinelinux.org/
[s6]: http://skarnet.org/software/s6/
[s6overlay]: https://github.com/just-containers/s6-overlay
[consul]: https://consul.io/
[semver]: http://semver.org/
[confd]: https://github.com/kelseyhightower/confd
[dockeralpinedesign]: https://github.com/smebberson/docker-alpine/blob/master/DESIGN.md
[alpinebasedns]: https://github.com/smebberson/docker-alpine/tree/master/alpine-base#dns
[rabbitmq]: http://www.rabbitmq.com/
[consultemplate]: https://github.com/hashicorp/consul-template

## Contributing

We love contributors. Read [CONTRIBUTING.md](CONTRIBUTING.md) for more information on how to contribute to this project.

## Contributors

- [smebberson](https://github.com/smebberson)
- [matthewvalimaki](https://github.com/matthewvalimaki)
- [sandytrinh](https://github.com/sandytrinh)
- [gaff](https://github.com/Gaff)

You can view [more information about the contributors here](https://github.com/smebberson/docker-alpine/graphs/contributors).
