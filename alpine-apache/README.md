# alpine-apache

A Docker image for running [Apache][apache], based on Alpine Linux.
This image belongs to a suite of images [documented here][dockeralpine].

## Features

This image features:

- [Alpine Linux][alpinelinux]
- [s6][s6] and [s6-overlay][s6overlay]
- [Apache][apache]

## Versions

- `2.0.1`, `latest` [(Dockerfile)](https://github.com/smebberson/docker-alpine/tree/alpine-apache-v2.0.1/alpine-apache)
- `2.0.0` [(Dockerfile)](https://github.com/smebberson/docker-alpine/tree/alpine-apache-v2.0.0/alpine-apache)
- `1.0.0` [(Dockerfile)](https://github.com/smebberson/docker-alpine/tree/alpine-apache-v1.0.0/alpine-apache)

[See VERSIONS.md for image contents.](https://github.com/smebberson/docker-alpine/blob/master/alpine-apache/VERSIONS.md)

## Usage

To use this image include `FROM smebberson/alpine-apache` at the top of your `Dockerfile`, or simply `docker run -p 80:80 -p 443:443 --name apache smebberson/alpine-apache`.

Apache logs (access and error logs) aren't automatically streamed to `stdout` and `stderr`. To review the logs, you can do one of two things:

Run the following in another terminal window:

```
docker exec -i apache tail -f /var/log/apache2/access.log -f /var/log/apache2/error.log
```

or, in your `Dockerfile` symlink the Apache logs to `stdout` and `stderr`:

```
RUN ln -sf /dev/stdout /var/log/apache2/access.log && \
    ln -sf /dev/stderr /var/log/apache2/error.log
```

## Customisation

This container comes setup as follows:

- Apache will be automatically started for you.
- If Apache dies, so will the container.

### HTML content

To alter the HTML content that Apache serves up, add the following to your Dockerfile:

```
ADD /path/to/content /var/www/localhost/
```

The `/var/www/localhost/htdocs` directory is the default document root, and `index.html` is set as the directory index (so `index.html` will get served if you don't ask for a file in the url), but these are easily changed by using your own `httpd.conf` (see below).

### Apache configuration

A basic Apache configuration is supplied with this image. However, it's easy to overwrite:

- Create your own `httpd.conf`.
- In your `Dockerfile`, make sure your `httpd.conf` file is copied to `/etc/apache/httpd.conf`.

### Restarting Apache

Execute the command `s6-svc -h /etc/services.d/apache` to send a `SIGHUP` to Apache and have it reload configuration, launching new worker process(es) using this new configuration, while gracefully shutting down the old worker processes.

### Apache crash

By default, if Apache crashes, the container will stop. This has been configured within `root/etc/services.d/apache/finish`. This is so the host machine can handle any issues, and automatically restart it (the docker way, `docker run --autorestart`).

If you don't want this to happen, simply replace the `root/etc/services.d/apache/finish` with a different file in your image. I like to `ln -s /bin/true /root/etc/services.d/apache/finish` in those instances in which you don't need a finish script and want to have the service restarted by s6.

### Apache configuration

If you need to, you can run a setup script before starting apache. During your `Dockerfile` build process, copy across a file to `/etc/services.d/apache/run` with the following (or customise it as required):

```
#!/usr/bin/env sh

if [ -e ./setup ]; then
./setup
fi

# start apache
exec /usr/sbin/apachectl -DFOREGROUND;
```

## Example

An example of using this image can be found in [examples/user-apache][alpineapache].

[apache]: https://httpd.apache.org/
[dockeralpine]: https://github.com/smebberson/docker-alpine
[alpineapache]: https://github.com/smebberson/docker-alpine/tree/master/examples/user-apache
