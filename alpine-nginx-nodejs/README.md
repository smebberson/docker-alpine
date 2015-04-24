alpine-nginx-nodejs
===================

An image for using both nginx and Node.js within the same container, bundled with [Alpine Linux][alpinelinux] and [s6][s6]. This is a combination of [smebberson/alpine-nginx][smebbersonalpinenginx] and [smebberson/alpine-nodejs][smebbersonalpinenodejs].

_**What's the use case for such a container?**_

My scenario:

- Nginx serves my static files.
- Nginx also proxies to my web-application (in another container).
- Node.js listens for changes to the web-application container and reconfigures and restarts nginx.

Usage
-----

To use this image include `FROM smebberson/alpine-nginx-nodejs` at the top of your `Dockerfile`. Inheriting from `smebberson/alpine-nginx-nodejs` provides you with the ability to run nginx, with container that has Node.js for easy configuration.

The container will automatically start nginx for you. For information about how to customise the nginx setup, and where to put your static files [read the guide for smebberson/alpine-nginx][smebbersonalpinenginxgithub].

The contianer won't automatically start or manage your Node.js application. For information about how to set this up, [read the guide for smebberson/alpine-nodejs][smebbersonalpinenodejsgithub].

### Logging

nginx logs won't automatically stream to stdout. [Read the guide for smebberson/alpine-nginx][smebbersonalpinenginxgithub] to learn how to access the logs.

If Node.js application logs to stdout (which `console.log` does) then you'll be able to review your logs using the standard [Docker process][dockerlogs].

[s6]: http://www.skarnet.org/software/s6/
[dockerlogs]: https://docs.docker.com/reference/commandline/cli/#logs
[alpinelinux]: https://www.alpinelinux.org/
[alpinebase]: (https://registry.hub.docker.com/u/smebberson/alpine-base/)
[smebbersonalpinenginx]: https://registry.hub.docker.com/u/smebberson/alpine-nginx/
[smebbersonalpinenodejs]: https://registry.hub.docker.com/u/smebberson/alpine-nodejs/
[smebbersonalpinenginxgithub]: https://github.com/smebberson/docker-alpine/tree/master/alpine-nginx
[smebbersonalpinenodejs]: https://github.com/smebberson/docker-alpine/tree/master/alpine-nginx
