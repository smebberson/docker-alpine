FROM smebberson/alpine-base
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

ENV CONSUL_VERSION=0.5.2 GOMAXPROCS=2

# Download and install Consul
RUN apk add --update go git gcc musl-dev && \
    GOPATH=/go go get github.com/hashicorp/consul && \
    cd /bin && \
    GOPATH=/go go build github.com/hashicorp/consul && \
    rm -rf /go && \
    apk del go git gcc musl-dev && \
    rm -rf /var/cache/apk/* && \
    addgroup consul && \
    adduser -D -G consul consul && \
    mkdir -p /data/consul && \
    chown -R consul:consul /data/consul

# Add the files
ADD root /

VOLUME ["/data/consul"]

EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 53 53/udp
