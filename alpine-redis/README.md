# alpine-redis

A Docker image for running [Redis][redis], based on Alpine Linux.
This image belongs to a suite of images [documented here][dockeralpine].

## Features

This image features:

- [Alpine Linux][alpinelinux]
- [s6][s6] and [s6-overlay][s6overlay]
- [Redis][redis]

## Versions

- `1.0.0`, `latest` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-redis-v1.0.0/alpine-redis/Dockerfile)

[See VERSIONS.md for image contents.](https://github.com/smebberson/docker-alpine/blob/master/alpine-redis/VERSIONS.md)

## Usage

To use this image include `FROM smebberson/alpine-redis` at the top of your `Dockerfile`, or simply `docker run --name redis smebberson/alpine-redis`.

Redis logs (access and error logs) are automatically streamed to `stdout`.

## Customisation

This container comes setup as follows:

- Redis is automatically started for you.
- If Redis dies, so will the container.
- A basic Redis configuration which you can [review and customise][redisconfig].

To update the configuration:

- Create a file called `redis-local.conf`, fill it with all of the config overrides that you require.
- In your `Dockerfile`, copy this file to `/etc/redis-local.conf`.

Redis will start and load the config at `/etc/redis.conf`, and then load `/etc/redis-local.conf` and apply any overrides.

## Example

An example of using this image can be found in [examples/user-redis][example].

[alpinelinux]: https://www.alpinelinux.org/
[consul]: https://consul.io/
[s6]: http://www.skarnet.org/software/s6/
[s6overlay]: https://github.com/just-containers/s6-overlay
[dockeralpine]: https://github.com/smebberson/docker-alpine
[redis]: http://redis.io/
[redisconfig]: https://github.com/smebberson/docker-alpine/blob/master/alpine-redis/root/etc/redis.conf
[example]: https://github.com/smebberson/docker-alpine/tree/master/examples/user-redis
