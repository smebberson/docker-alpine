FROM smebberson/alpine-consul-base:4.2.0
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

ENV REDIS_VERSION=3.2.5-r0

# Install redis.
RUN apk upgrade --update --no-cache && \
    apk add --update --no-cache redis=$REDIS_VERSION && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /data/redis && \
    chown -R redis:redis /data/redis && \
    echo -e "include /etc/redis-local.conf\n" >> /etc/redis.conf

# Add the files.
ADD root /

# A volume for the redis files.
VOLUME ["/data/redis"]

# Expose the ports for redis.
EXPOSE 6379
