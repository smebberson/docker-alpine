alpine-consul-nginx
===================

An image for using [nginx][nginx], bundled with [Alpine Linux][alpinelinux] and [s6][s6] and [Consul][consul].

This image is perfect if you're looking to run a Node.js application within a Docker setup and wanting to benefit from Consul for service registration and discovery. It's also very small clocking in at only ~31MB.

**_Yet another container for running nginx?_**

Yes, but this one is built from [smebberson/alpine-consul-base][alpinebase] that contains [s6][s6] for process management, and Consul for service registration and discovery. Small, fast and flexible.

_**Aren't you only supposed to run one process per container?**_

Hell no! The following are good examples of when multiple processes within one container might be necessary:

- Automatically updating [nginx][nginx] proxy settings when a down-stream application server (nodejs, php, etc) restarts (and the IP changes).
- Automatically updating [HAProxy][haproxy] configuration to load balance to a group of down-stream application servers.
- Running a logging daemon to centralize log management (i.e. [logentries][logentries], [loggly][loggly], [logstash][logstash]).
- When you need to run a script on application server crash (to tidy something up), as the standard [Docker container restart policies][drsp] won't provide this.

In all of these instances, there is one primary services and secondary support services. When the secondary support services fail, they should be automatically restarted. When the primary service fails, the container itself should restart.

## Versions

- `1.0.0`, `latest` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/master/alpine-consul-nginx/Dockerfile)

[See VERSIONS.md for image contents.](https://github.com/smebberson/docker-alpine/blob/master/alpine-consul-nginx/VERSIONS.md)

Usage
-----

To use this image include `FROM smebberson/alpine-consul-nginx` at the top of your `Dockerfile`, or simply `docker run -p 80:80 -p 443:443 --name nginx smebberson/alpine-consul-nginx`.

Customisation
-------------

This container comes setup as follows:

- s6 will automatically start nginx for you.
- If nginx dies, so will the container.
- A basic nginx configuration and a simple default HTML file.
- Consul service registration, and health check of the nginx service.

Nginx logs (access and error logs) are automatically streamed to stdout. A service of name `nginx` is automatically setup within Consul, and a health check define to report availability of the service to Consul.

### HTML content

To alter the HTML content that nginx serves up (add your website files), add the following to your Dockerfile:

```
ADD /path/to/content /usr/html/
```

index.html is the default, but that's easily changed (see below).

### Nginx configuration

A basic nginx configuration is supplied with this image. But it's easy to overwrite:

- Create your own `nginx.conf`.
- In your `Dockerfile`, make sure your `nginx.conf` file is copied to `/etc/nginx/nginx.conf`.

**Make sure you start nginx without daemon mode, by including `daemon off;` in your nginx configuration, otherwise the container will constantly exit right after nginx starts.**

### Restarting nginx

If you're running another process to keep track of something down-stream (for example, automatically updating [nginx][nginx] proxy settings when a down-stream application server (nodejs, php, etc) restarts) execute the command `s6-svc -h /var/run/s6/services/nginx` to send a `SIGHUP` to nginx and have it reload its configuration, launch new worker process(es) using this new configuration, while gracefully shutting down the old worker processes.

### nginx crash

By default, if nginx crashes, the container will stop. This has been configured within `root/etc/services.d/nginx/finish`. This is so the host machine can handle any issues, and automatically restart it (the docker way, `docker run --autorestart`).

If you don't want this to happen, simply replace the `root/etc/services.d/nginx/finish` with a different file in your image. I like to `ln -s /bin/true /root/etc/services.d/nginx/finish` in those instances.

### Nginx pre-start configuration

If you need to, you can run a setup script before starting nginx. During your `Dockerfile` build process, copy across a file to `/etc/services.d/nginx/run` with the following (or customise it as required):

```
#!/usr/bin/env sh

if [ -e ./setup ]; then
./setup
fi

# start nginx
exec nginx;
```

### Consul service registration

By default the file at `/etc/consul.d/nginx.json` will register an `nginx` service, on port `80` with Consul. It also registers a 5s health check that reports on the availability of the service. If you'd like to configure perhaps more ports, or change the health check simply create a new file that meets the requirements of a [Consul service definition][consulservicedef] and add it (in your Dockerfile) to your image, replacing the already existing `nginx.json`.

[s6]: http://www.skarnet.org/software/s6/
[s6-built-statically]: https://github.com/smebberson/docker-ubuntu-base/blob/master/s6/s6-build
[logentries]: https://logentries.com/
[loggly]: https://www.loggly.com/
[logstash]: http://logstash.net/
[drsp]: https://docs.docker.com/reference/commandline/cli/#restart-policies
[nginx]: http://nginx.org/
[haproxy]: http://www.haproxy.org/
[alpinebase]: https://registry.hub.docker.com/u/smebberson/alpine-base/
[s6]: http://www.skarnet.org/software/s6/
[dockerlogs]: https://docs.docker.com/reference/commandline/cli/#logs
[consulservicedef]: https://www.consul.io/docs/agent/services.html
