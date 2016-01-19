FROM smebberson/alpine-influxdb:dev
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

ENV INFLUXDB_ADMIN_ENABLED="true" INFLUXDB_HTTP_AUTH_ENABLED="true" INFLUXDB_HTTP_USERNAME="dockeralpineinfluxdb" INFLUXDB_HTTP_PASSWORD="passw0rd"

RUN ln -sf /dev/stderr /var/log/influxdb/influxdb.log
