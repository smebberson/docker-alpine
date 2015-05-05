FROM smebberson/alpine-consul-base
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

# Install redis
RUN apk add --update redis && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /data/redis && \
    chown -R redis:redis /data/redis && \
    echo -e "include /etc/redis-local.conf\n" >> /etc/redis.conf

# Add the files
ADD root /

VOLUME ["/data/redis"]

# Expose the ports for redis
EXPOSE 6379
