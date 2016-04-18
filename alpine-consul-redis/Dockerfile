FROM smebberson/alpine-consul-base:1.0.0
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

# Install redis
RUN echo "http://dl-4.alpinelinux.org/alpine/v3.1/main" >> /etc/apk/repositories && \
    apk add --update redis=2.8.23-r0 && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /data/redis && \
    chown -R redis:redis /data/redis && \
    echo -e "include /etc/redis-local.conf\n" >> /etc/redis.conf

# Add the files
ADD root /

VOLUME ["/data/redis"]

# Expose the ports for redis
EXPOSE 6379
