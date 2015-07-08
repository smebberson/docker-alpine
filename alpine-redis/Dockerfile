FROM smebberson/alpine-base
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

# Install redis
RUN apk add --update redis && \
    rm -rf /var/cache/apk/* && \
    mkdir /data && \
    chown -R redis:redis /data && \
    echo -e "include /etc/redis-local.conf\n" >> /etc/redis.conf

# Add the files
ADD root /

VOLUME ["/data"]

# Expose the ports for redis
EXPOSE 6379
