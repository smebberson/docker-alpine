# alpine-nginx-nodejs

A Docker image for running [nginx][nginx] with [Node.js][nodejs], based on Alpine Linux.
This image belongs to a suite of images [documented here][dockeralpine].

## Features

This image features:

- [Alpine Linux][alpinelinux]
- [s6][s6] and [s6-overlay][s6overlay]

## Versions

- `4.4.0`, `latest` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-nginx-nodejs-v4.4.0/alpine-nginx-nodejs/Dockerfile)
- `4.3.1` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-nginx-nodejs-v4.3.1/alpine-nginx-nodejs/Dockerfile)
- `4.3.0` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-nginx-nodejs-v4.3.0/alpine-nginx-nodejs/Dockerfile)
- `4.2.2` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-nginx-nodejs-v4.2.2/alpine-nginx-nodejs/Dockerfile)
- `4.2.1` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-nginx-nodejs-v4.2.1/alpine-nginx-nodejs/Dockerfile)
- `4.2.0` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-nginx-nodejs-v4.2.0/alpine-nginx-nodejs/Dockerfile)
- `4.1.0` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-nginx-nodejs-v4.1.0/alpine-nginx-nodejs/Dockerfile)
- `4.0.0` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-nginx-nodejs-v4.0.0/alpine-nginx-nodejs/Dockerfile)
- `3.1.1` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-nginx-nodejs-v3.1.0/alpine-nginx-nodejs/Dockerfile)
- `3.1.0` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-nginx-nodejs-v3.1.0/alpine-nginx-nodejs/Dockerfile)
- `3.0.0` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-nginx-nodejs-v3.0.0/alpine-nginx-nodejs/Dockerfile)
- `2.1.1` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-nginx-nodejs-v2.1.1/alpine-nginx-nodejs/Dockerfile)
- `2.1.0` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-nginx-nodejs-v2.1.0/alpine-nginx-nodejs/Dockerfile)
- `2.0.0` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-nginx-nodejs-v2.0.0/alpine-nginx-nodejs/Dockerfile)
- `1.0.0` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-nginx-nodejs-v1.0.0/alpine-nginx-nodejs/Dockerfile)

[See VERSIONS.md for image contents.](VERSIONS.md)
[See NODEJS.md to find specific Node.js versions.](NODEJS.md)

## Usage

To use this image include `FROM smebberson/alpine-nginx-nodejs` at the top of your `Dockerfile`. Inheriting from `smebberson/alpine-nginx-nodejs` provides you with the ability to run nginx, within a container that has Node.js for easy configuration.

The container will automatically start nginx for you. For information about how to customise the nginx setup, and where to put your static files [read the guide for smebberson/alpine-nginx][smebbersonalpinenginxgithub].

The container won't automatically start or manage your Node.js application. For information about how to set this up, [read the guide for smebberson/alpine-nodejs][smebbersonalpinenodejsgithub].

### Logging

nginx logs won't automatically stream to stdout. [Read the guide for smebberson/alpine-nginx][smebbersonalpinenginxgithub] to learn how to access the logs.

If Node.js application logs to stdout (which `console.log` does) then you'll be able to review your logs using the standard [Docker process][dockerlogs].

## Example

An example of using this image can be found in [examples/user-nginx-nodejs][example].

[dockeralpine]: https://github.com/smebberson/docker-alpine
[s6]: http://www.skarnet.org/software/s6/
[s6overlay]: https://github.com/just-containers/s6-overlay
[dockerlogs]: https://docs.docker.com/reference/commandline/cli/#logs
[alpinelinux]: https://www.alpinelinux.org/
[alpinebase]: (https://registry.hub.docker.com/u/smebberson/alpine-base/)
[smebbersonalpinenginx]: https://registry.hub.docker.com/u/smebberson/alpine-nginx/
[smebbersonalpinenodejs]: https://registry.hub.docker.com/u/smebberson/alpine-nodejs/
[smebbersonalpinenginxgithub]: https://github.com/smebberson/docker-alpine/tree/master/alpine-nginx
[smebbersonalpinenodejs]: https://github.com/smebberson/docker-alpine/tree/master/alpine-nginx
[example]: https://github.com/smebberson/docker-alpine/tree/master/examples/user-nginx-nodejs
[nodejs]: https://nodejs.org/
[nginx]: http://nginx.org/
