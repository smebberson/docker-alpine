FROM smebberson/alpine-base:3.2.0
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

ENV CONSUL_VERSION=0.8.5 \
    CONSUL_DOMAIN=consul \
    CONSUL_DATA_DIR=/data/consul \
    CONSUL_CONFIG_DIR=/etc/consul/conf.d/bootstrap \
    CONSUL_SERVER_NAME=consul \
    CONSUL_DC=dc1 \
    CONSUL_CLIENT=0.0.0.0 \
    CONSUL_RETRY_INTERVAL=5s

# Download and install Consul
RUN apk upgrade --update --no-cache && \
    apk add --update --no-cache curl util-linux && \
    curl -sSLo /tmp/consul.zip https://releases.hashicorp.com/consul/{$CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip && \
    unzip -d /bin /tmp/consul.zip && \
    rm /tmp/consul.zip && \
    apk del curl && \
    addgroup consul && \
    adduser -D -g "" -s /bin/sh -G consul consul && \
    mkdir -p /data/consul && \
    chown -R consul:consul /data/consul

# Add the files
COPY root /

VOLUME ["/data/consul"]

EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 8500 8600 8600/udp 53 53/udp
