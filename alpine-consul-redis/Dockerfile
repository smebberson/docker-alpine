FROM smebberson/alpine-consul-base:4.0.0
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

# Install redis.
RUN echo "http://dl-4.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    apk add --no-cache redis=3.2.0-r0 && \
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
