FROM smebberson/alpine-confd:1.0.2
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

ENV INFLUXDB_VERSION=0.9.6.1

RUN export GOPATH=/go && \
    echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    apk add --update go=1.5.3-r0 git musl-dev curl && \
    go get github.com/influxdb/influxdb && \
    cd $GOPATH/src/github.com/influxdb/influxdb && \
    go get -v -u -f -t ./... && \
    git checkout -q --detach "v${INFLUXDB_VERSION}" && \
    go clean -v ./... && \
    go install -v ./... && \
    chmod +x $GOPATH/bin/* && \
    mv $GOPATH/bin/* /bin/ && \
    apk del go git musl-dev && \
    rm -rf /var/cache/apk/* $GOPATH && \
    addgroup influxdb && \
    adduser -D -G influxdb influxdb && \
    mkdir -p /etc/influxdb /data/influxdb /data/influxdb/meta /data/influxdb/data /var/tmp/influxdb/wal /var/log/influxdb

# Add the files
ADD root /

VOLUME ["/data/influxdb"]

EXPOSE 8083 8086
