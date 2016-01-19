# alpine-influxdb

An image for using [influxdb][influxdb] within Docker containers.

This image is one of many Docker images designed to run multiple services per container (grouped sparingly and logically of course). You can read more about the philosophy of these images [here][dockeralpinedesign].

## Features

This image features:

- [Alpine Linux][alpinelinux]
- [s6][s6] and [s6-overlay][s6overlay]
- [influxdb][influxdb]

## Usage

To use this image include `FROM smebberson/alpine-influxdb` at the top of your `Dockerfile`, or simply `docker run --name consul smebberson/alpine-influxdb`.

InfluxDB logs aren't automatically streamed to `stderr` (which is the default). To review the logs, you can do one of two things:

Run the following in another terminal window:

```
docker exec -i nginx tail -f /var/log/influxdb/influxdb.log
```

or, in your `Dockerfile` symlink the InfluxDB logs to `stderr`:

```
RUN ln -sf /dev/stderr /var/log/influxdb/influxdb.log
```

## Customisation

This container comes setup as follows:

- s6 will automatically start InfluxDB for you.
- If InfluxDB dies, the container will exit.
- InfluxDB logs will not automatically stream to `stdout`.
- InfluxDB will run as the unprivileged `influxdb` user.

The InfluxDB configuration file is generated from `confd` (making use of environment variables) and is located at `/root/etc/confd/templates/influxdb.tmpl`. Defaults for the values used to generate the configuration can be found at `/root/etc/cont-init.d/05-env`.

It can be customised with the following environment variables:

- `INFLUXDB_META_DIR`, defaults to `/data/influxdb/meta`.
- `INFLUXDB_META_HOSTNAME`, defaults to `localhost`.
- `INFLUXDB_META_BIND_ADDRESS`, defaults to `:8088`.
- `INFLUXDB_DATA_DIR`, defaults to `/data/influxdb/data`.
- `INFLUXDB_DATA_WAL_DIR`, defaults to `/var/tmp/influxdb/wal`.
- `INFLUXDB_DATA_WAL_LOGGING_ENABLED`, defaults to `false`.
- `INFLUXDB_ADMIN_ENABLED`, defaults to `false`.
- `INFLUXDB_ADMIN_BIND_ADDRESS`, defaults to `:8083`.
- `INFLUXDB_HTTP_AUTH_ENABLED`, defaults to `false`.
- `INFLUXDB_HTTP_BIND_ADDRESS`, defaults to `:8086`.

If you've set `INFLUXDB_HTTP_AUTH_ENABLED` to `true`, also set `INFLUXDB_HTTP_USERNAME` and `INFLUXDB_HTTP_PASSWORD` and a new user with all privileges will automatically be created.

### InfluxDB configuration

To customise configuration for InfluxDB, further than the environment variables allow, replace the file at `root/etc/confd/templates/influxdb.tmpl` with your own configuration. This file will be output to `/etc/influxdb/influxdb.toml` after being run through `confd` (so it is possible to maintain the use of environment variables here, and even extend them to use your own).

### InfluxDB log file

The simplest way is to set an environment variable in your `Dockerfile`:

```
FROM smebberson/alpine-influxdb

ENV INFLUXDB_LOG_FILE="/var/log/custom_path/influxd.log"

```

### Container exiting

By default, if InfluxDB crashes, the container will stop. This has been configured within `root/etc/services.d/influxdb/finish`. This is so the host machine can handle any issues, and automatically restart it (the docker way, `docker run --autorestart`).

If you don't want this to happen, simply replace the `root/etc/services.d/influxdb/finish` with a different file in your image. I like to `ln -s /bin/true /root/etc/services.d/influxdb/finish` in those instances in which you don't need a finish script and want to have the service restarted by s6.

[s6]: http://www.skarnet.org/software/s6/
[influxdb]: https://influxdata.com/
[dockeralpinedesign]: https://github.com/smebberson/docker-alpine/blob/master/DESIGN.md
