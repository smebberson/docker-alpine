# alpine-influxdb-telegraf-telegraf

An image for using [influxdb][influxdb], via [telegraf][telegraf] within Docker containers.

This image is one of many Docker images designed to run multiple services per container (grouped sparingly and logically of course). You can read more about the philosophy of these images [here][dockeralpinedesign].

Telegraf makes working with InfluxDB much simpler. It has a number of plugins to automate the process of getting data into InfluxDB. It can also act as a StatsD server allowing you to use the StatsD protocol (an extended version) to easily push data into InfluxDB.

## Features

This image features:

- [Alpine Linux][alpinelinux]
- [s6][s6] and [s6-overlay][s6overlay]
- [influxdb][influxdb]
- [telegraf][telegraf]

## Usage

To use this image include `FROM smebberson/alpine-influxdb-telegraf` at the top of your `Dockerfile`, or simply `docker run --name consul smebberson/alpine-influxdb-telegraf`.

Please review [the usage guide for alpine-influxdb][alpineinfluxdbusageguide] for more information on manipulating InfluxDB within this image.

Telegraf logs aren't automatically streamed to `stdout` (which is the default). To review the logs, you can do one of two things:

Run the following in another terminal window:

```
docker exec -i nginx tail -f /var/log/telegraf/telegraf.log
```

or, in your `Dockerfile` symlink the Telegraf logs to `stderr`:

```
RUN ln -sf /dev/stderr /var/log/telegraf/telegraf.log
```

## Customisation

This container comes setup as follows:

- s6 will automatically start Telegraf for you.
- If Telegraf dies it will automatically be restarted.
- Telegraf logs will not automatically stream to `stdout`.
- Telegraf will run as the unprivileged `influxdb` user.

The Telegraf configuration file is generated from `confd` (making use of environment variables) and is located at `/root/etc/confd/templates/telegraf.tmpl`. Defaults for the values used to generate the configuration can be found at `/root/etc/cont-init.d/10-env`.

The default setup of this container is to push data through the StatsD protocol and into InfluxDB. There are many other configurations possible, but you'll need to set them up with a customised version of the `telegraf.tmpl` (optionally using environment variables).

It can be customised with the following environment variables:

- `TELEGRAF_OUTPUTS_INFLUXDB_URLS`, defaults to `"http://localhost:8086\"`.
- `TELEGRAF_OUTPUTS_INFLUXDB_DATABASE`, defaults to `telegraf`.
- `TELEGRAF_OUTPUTS_INFLUXDB_PRECISION`, defaults to `s`.
- `TELEGRAF_OUTPUTS_INFLUXDB_TIMEOUT`, defaults to `0s`.
- `TELEGRAF_OUTPUTS_INFLUXDB_USERNAME` which is not used unless it is defined.
- `TELEGRAF_OUTPUTS_INFLUXDB_PASSWORD` which is not used unless it is defined.
- `TELEGRAF_OUTPUTS_INFLUXDB_USER_AGENT`, which is not used unless it is defined.
- `TELEGRAF_PLUGINS_STATSD_SERVICE_ADDRESS`, defaults to `:8125`.
- `TELEGRAF_PLUGINS_STATSD_DELETE_GAUGES`, defaults to `false`.
- `TELEGRAF_PLUGINS_STATSD_DELETE_COUNTERS`, defaults to `false`.
- `TELEGRAF_PLUGINS_STATSD_DELETE_SETS`, defaults to `false`.
- `TELEGRAF_PLUGINS_STATSD_DELETE_TIMINGS`, defaults to `false`.
- `TELEGRAF_OUTPUTS_INFLUXDB_USERNAME`, defaults to `INFLUXDB_HTTP_USERNAME`.
- `TELEGRAF_OUTPUTS_INFLUXDB_PASSWORD`, defaults to `INFLUXDB_HTTP_PASSWORD`.

### Telegraf configuration

To customise configuration for Telegraf, further than the environment variables allow, replace the file at `root/etc/confd/templates/telegraf.tmpl` with your own configuration. This file will be output to `/etc/telegraf/telegraf.toml` after being run through `confd` (so it is possible to maintain the use of environment variables here, and even extend them to use your own).

### Container exiting

Because this container inherits from `alpine-influxdb`, if InfluxDB crashes, the container will stop. If Telegraf crashes, it will be restarted. This has been configured within `root/etc/services.d/influxdb/finish`. This is so the host machine can handle any issues, and automatically restart it (the docker way, `docker run --autorestart`).

If you don't want this to happen, simply replace the `root/etc/services.d/influxdb/finish` with a different file in your image. I like to `ln -s /bin/true /root/etc/services.d/influxdb/finish` in those instances in which you don't need a finish script and want to have the service restarted by s6.

[s6]: http://www.skarnet.org/software/s6/
[influxdb]: https://influxdata.com/time-series-platform/influxdb/
[telegraf]: https://influxdata.com/time-series-platform/telegraf/
[dockeralpinedesign]: https://github.com/smebberson/docker-alpine/blob/master/DESIGN.md
[alpineinfluxdbusageguide]: https://github.com/smebberson/docker-alpine/tree/alpine-influxdb/alpine-influxdb
