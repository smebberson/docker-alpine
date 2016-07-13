# alpine-consul-redis

A Docker image for running [Redis][redis] with [Consul][consul], based on Alpine Linux.
This image belongs to a suite of images [documented here][dockeralpine].

Image size is ~51.3 MB.

## Features

This image features:

- [Alpine Linux][alpinelinux]
- [s6][s6] and [s6-overlay][s6overlay]
- [Redis][redis]
- [consul][consul]

## Versions

- `2.0.0`, `latest` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-consul-redis-v2.0.0/alpine-consul-redis/Dockerfile)
- `1.0.0` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-consul-redis-v1.0.0/alpine-consul-redis/Dockerfile)

[See VERSIONS.md for image contents.](https://github.com/smebberson/docker-alpine/blob/master/alpine-consul-redis/VERSIONS.md)

## Usage

To use this image include `FROM smebberson/alpine-consul-redis` at the top of your `Dockerfile`, or simply `docker run --name redis smebberson/alpine-consul-redis`.

This container has been setup to automatically connect to a Consul cluster, created with a service name of `consul`. [Read more about it here](https://github.com/smebberson/docker-alpine/tree/master//alpine-consul).

## Customisation

This container comes setup as follows:

- Redis will be automatically started for you.
- If Redis dies, so will the container.
- A basic Redis configuration which you can [review and customise][redisconfig].

To update the configuration:

- Create a file called `redis-local.conf`, fill it with all of the config overrides that you require.
- In your `Dockerfile`, copy this file to `/etc/redis-local.conf`.

Redis will start and load the config at `/etc/redis.conf`, and then load `/etc/redis-local.conf` and apply any overrides.

### Consul service registration

This container is automatically configured to register itself with Consul, as the `redis` service operating on port `6379`. It comes with a script `/usr/bin/redis-check`, that is wired up to a Consul service health check.

Any of these files can be changed in your image, as required to customise the setup.

## Example

An example of using this image can be found in [examples/user-consul-redis][example].

[dockeralpine]: https://github.com/smebberson/docker-alpine
[s6]: http://www.skarnet.org/software/s6/
[s6overlay]: https://github.com/just-containers/s6-overlay
[alpinelinux]: https://www.alpinelinux.org/
[consul]: https://consul.io/
[redisconfig]: https://github.com/smebberson/docker-alpine/blob/master/alpine-consul-redis/root/etc/redis.conf
[redis]: http://redis.io/
[example]: https://github.com/smebberson/docker-alpine/tree/master/examples/user-consul-redis
