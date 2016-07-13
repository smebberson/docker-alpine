FROM smebberson/alpine-base:3.0.0
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

ENV CONSUL_VERSION=0.6.4 \
    CONSUL_DOMAIN=consul \
    CONSUL_CONFIG_DIR=/etc/consul/conf.d/bootstrap \
    CONSUL_SERVER_NAME=consul

# Download and install Consul
RUN apk add --no-cache curl && \
    curl -sSLo /tmp/consul.zip https://releases.hashicorp.com/consul/{$CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip && \
    unzip -d /bin /tmp/consul.zip && \
    rm /tmp/consul.zip && \
    apk del curl && \
    addgroup consul && \
    adduser -D -g "" -s /bin/sh -G consul consul && \
    mkdir -p /data/consul && \
    chown -R consul:consul /data/consul

# Add the files
ADD root /

VOLUME ["/data/consul"]

EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 8500 53 53/udp
