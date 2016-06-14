# alpine-consul-nginx

A Docker image for running [nginx][nginx] with [Consul][consul], based on Alpine Linux.
This image belongs to a suite of images [documented here][dockeralpine].

Image size is ~50.9 MB.

## Features

This image features:

- [Alpine Linux][alpinelinux]
- [s6][s6] and [s6-overlay][s6overlay]
- [Nginx][nginx]
- [consul][consul]

## Versions

- `3.0.0`, `latest` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-consul-nginx-v3.0.0/alpine-consul-nginx/Dockerfile)
- `2.0.0` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-consul-nginx-v2.0.0/alpine-consul-nginx/Dockerfile)
- `1.0.0` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-consul-nginx-v1.0.0/alpine-consul-nginx/Dockerfile)

[See VERSIONS.md for image contents.](https://github.com/smebberson/docker-alpine/blob/master/alpine-consul-nginx/VERSIONS.md)

## Usage

To use this image include `FROM smebberson/alpine-consul-nginx` at the top of your `Dockerfile`, or simply `docker run -p 80:80 -p 443:443 --name nginx smebberson/alpine-consul-nginx`.

This container has been setup to automatically connect to a Consul cluster, created with a service name of `consul`. [Read more about it here](https://github.com/smebberson/docker-alpine/tree/master//alpine-consul).

## Customisation

This container comes setup as follows:

- nginx is automatically started for you.
- If nginx dies, so will the container.
- A basic nginx configuration and a simple default HTML file.
- Consul service registration, and health check of the nginx service.

nginx logs (access and error logs) are automatically streamed to `stdout`. A service of name `nginx` is automatically setup within Consul, and a health check defined to report availability of the service to Consul.

### HTML content

To alter the HTML content that nginx serves up (add your website files), add the following to your Dockerfile:

```
ADD /path/to/content /usr/html/
```

index.html is the default, but that's easily changed (see below).

### nginx configuration

A basic nginx configuration is supplied with this image. But it's easy to overwrite:

- Create your own `nginx.conf`.
- In your `Dockerfile`, make sure your `nginx.conf` file is copied to `/etc/nginx/nginx.conf`.

**Make sure you start nginx without daemon mode, by including `daemon off;` in your nginx configuration, otherwise the container will constantly exit right after nginx starts.**

### Restarting nginx

If you're running another process to keep track of something down-stream (for example, automatically updating [nginx][nginx] proxy settings when a down-stream application server (nodejs, php, etc) restarts) execute the command `s6-svc -h /var/run/s6/services/nginx` to send a `SIGHUP` to nginx and have it reload its configuration, launch new worker process(es) using this new configuration, while gracefully shutting down the old worker processes.

### nginx crash

By default, if nginx crashes, the container will stop. This has been configured within `root/etc/services.d/nginx/finish`. This is so the host machine can handle any issues, and automatically restart it (the docker way, `docker run --autorestart`).

If you don't want this to happen, simply replace the `root/etc/services.d/nginx/finish` with a different file in your image. I like to `ln -s /bin/true /root/etc/services.d/nginx/finish` in those instances.

### nginx pre-start configuration

If you need to, you can run a setup script before starting nginx. During your `Dockerfile` build process, copy across a file to `/etc/services.d/nginx/run` with the following (or customise it as required):

```
#!/usr/bin/with-contenv sh

if [ -e ./setup ]; then
./setup
fi

# Start nginx.
nginx -g "daemon off;"
```

### Consul service registration

By default the file at `/etc/consul/conf.d/nginx.json` will register an `nginx` service, on port `80` with Consul. It also registers a 5s health check that reports on the availability of the service. If you'd like to configure perhaps more ports, or change the health check another way, create a new file that meets the requirements of a [Consul service definition][consulservicedef] and add it (in your Dockerfile) to your image, replacing the already existing `nginx.json`.

## Example

An example of using this image can be found in [examples/user-consul-nginx][example].

[alpinelinux]: https://www.alpinelinux.org/
[consul]: https://consul.io/
[s6]: http://www.skarnet.org/software/s6/
[s6overlay]: https://github.com/just-containers/s6-overlay
[apache]: https://httpd.apache.org/
[dockeralpine]: https://github.com/smebberson/docker-alpine
[nginx]: http://nginx.org/
[consulservicedef]: https://www.consul.io/docs/agent/services.html
[example]: https://github.com/smebberson/docker-alpine/blob/master/examples/user-consul-nginx/Dockerfile
