FROM smebberson/alpine-base
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

ENV RABBITMQ_CONFIG_FILE=/etc/rabbitmq/rabbitmq

ADD https://github.com/rabbitmq/rabbitmq-server/releases/download/rabbitmq_v3_5_4/rabbitmq-server-generic-unix-3.5.4.tar.gz /tmp/rabbitmq-server.tar.gz

RUN apk add --update curl tar gzip bash && \
    apk add erlang erlang erlang-mnesia erlang-public-key erlang-crypto erlang-ssl \
        erlang-sasl erlang-asn1 erlang-inets erlang-os-mon erlang-xmerl erlang-eldap \
        --update-cache --allow-untrusted \
        -X http://dl-4.alpinelinux.org/alpine/edge/main/ && \
    tar -xzvf /tmp/rabbitmq-server.tar.gz -C /usr/local && \
    rm -f /tmp/rabbitmq-server.tar.gz && \
    ln -s /usr/local/rabbitmq_server-3.5.4/sbin/* /usr/local/bin && \
    rabbitmq-plugins enable --offline rabbitmq_management && \
    apk del --purge tar gzip && \
    rm -rf /var/cache/apk/* && \
    addgroup rabbitmq && \
    adduser -D -s /bin/sh -G rabbitmq rabbitmq

ADD root /

# Expose ports for AMQP protocol and rabbitmq management plugin respectively
EXPOSE 5672/tcp 15672/tcp
