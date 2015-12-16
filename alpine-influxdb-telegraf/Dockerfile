FROM smebberson/alpine-influxdb:dev
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

ENV TELEGRAF_VERSION=0.2.4 GOMAXPROCS=2

RUN export GOPATH=/go && \
    echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    apk add --update go=1.5.2-r0 git musl-dev curl && \
    export GOPATH=/go && \
    go get github.com/influxdb/telegraf && \
    cd $GOPATH/src/github.com/influxdb/telegraf && \
    git checkout -q --detach "v${TELEGRAF_VERSION}" && \
    go get -v ./... && \
    go install -v ./... && \
    chmod +x $GOPATH/bin/* && \
    mv $GOPATH/bin/* /bin/ && \
    apk del go git musl-dev && \
    rm -rf /var/cache/apk/* $GOPATH && \
    mkdir -p /etc/telegraf

# Add the files
ADD root /

EXPOSE 8125/udp
