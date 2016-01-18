FROM smebberson/alpine-confd:1.0.1
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

ENV RABBITMQ_VERSION=3.5.7 ERLANG_PKG_VERSION=18.1-r5

# Setup Erlang, download RabbitMQ and setup the management plugin
RUN apk add --update curl tar gzip bash && \
    echo "http://dl-4.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    echo "http://dl-4.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    apk add --update-cache --allow-untrusted \
        erlang=${ERLANG_PKG_VERSION} erlang-mnesia=${ERLANG_PKG_VERSION} \
        erlang-public-key=${ERLANG_PKG_VERSION} erlang-crypto=${ERLANG_PKG_VERSION} \
        erlang-ssl=${ERLANG_PKG_VERSION} erlang-sasl=${ERLANG_PKG_VERSION} \
        erlang-asn1=${ERLANG_PKG_VERSION} erlang-inets=${ERLANG_PKG_VERSION} \
        erlang-os-mon=${ERLANG_PKG_VERSION} erlang-xmerl=${ERLANG_PKG_VERSION} erlang-eldap=${ERLANG_PKG_VERSION} && \
    curl -sSL https://www.rabbitmq.com/releases/rabbitmq-server/v${RABBITMQ_VERSION}/rabbitmq-server-generic-unix-${RABBITMQ_VERSION}.tar.gz | tar -xz -C / --strip-components 1 && \
    rm -rf /share/**/rabbitmq*.gz && \
    apk del --purge tar gzip curl && \
    rm -rf /var/cache/apk/* && \
    addgroup rabbitmq && \
    adduser -DS -G rabbitmq -s /bin/sh -h /var/lib/rabbitmq rabbitmq && \
    mkdir -p /data/rabbitmq

# Copy across our files
ADD root /

# Define mount points.
VOLUME ["/data/rabbitmq"]

# Expose ports for AMQP protocol and rabbitmq management plugin respectively
EXPOSE 5672/tcp 15672/tcp
