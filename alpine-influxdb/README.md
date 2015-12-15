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
docker exec -i nginx tail -f /var/log/influxdb/influxd.log
```

or, in your `Dockerfile` symlink the Nginx logs to `stderr`:

```
RUN ln -sf /dev/stderr /var/log/influxdb/influxd.log
```

## Customisation

This container comes setup as follows:

- s6 will automatically start InfluxDB for you.
- If InfluxDB dies, the container will exit.
- InfluxDB logs will not automatically stream to `stdout`.
- InfluxDB will run as the unprivileged `influxdb` user.

The InfluxDB configuration file that comes with this image is:

```
[meta]
  dir = "/data/influxdb/meta"

[data]
  dir = "/data/influxdb/data"
  wal-dir = "/var/tmp/influxdb/wal"
  wal-logging-enabled = false
```

### InfluxDB configuration

To customise configuration for InfluxDB, replace the file at `root/etc/influxdb/influxdb.conf` with your own configuration.

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
