FROM smebberson/alpine-base:1.2.0
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

ENV INFLUXDB_VERSION=0.9.6.1 GOMAXPROCS=2

# Statically build confd for Alpine Linux :)
RUN export GOPATH=/go && \
    echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    apk add --update go=1.5.2-r0 git mercurial gcc musl-dev && \
    go get github.com/influxdb/influxdb && \
    cd $GOPATH/src/github.com/influxdb/influxdb && \
    git checkout -q --detach "v${INFLUXDB_VERSION}" && \
    go get -u -f -t ./... && \
    go clean ./... && \
    go install ./... && \
    chmod +x $GOPATH/bin/* && \
    mv $GOPATH/bin/* /bin/ && \
    apk del go git mercurial gcc musl-dev && \
    rm -rf /var/cache/apk/* $GOPATH

RUN addgroup influxdb && \
    adduser -D -G influxdb influxdb && \
    mkdir -p /data/influxdb /data/influxdb/meta /data/influxdb/data /var/tmp/influxdb/wal /var/log/influxdb && \
    chown -R influxdb:influxdb /data/influxdb /var/tmp/influxdb /var/log/influxdb

# Add the files
ADD root /

VOLUME ["/data/influxdb"]

EXPOSE 8083 8086
