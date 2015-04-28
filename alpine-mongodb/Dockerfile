FROM smebberson/alpine-base
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

ENV MONGODB_VERSION 3.0.1

# Setup MongoDB from binaries
RUN apk add --update curl tar && \
    curl -sS http://downloads.mongodb.org/linux/mongodb-linux-x86_64-${MONGODB_VERSION}.tgz \
    | tar xz --no-same-owner -C /usr --strip-components 1 --wildcards -f - \*/bin/\* && \
    addgroup mongodb && \
    adduser -D -G mongodb mongodb && \
    mkdir -p /data/db && \
    chown -R mongodb:mongodb /data/db && \
    apk del curl tar && \
    rm -rf /var/cache/apk/*

# Add the files
ADD root /

# Expose the volume to the host
VOLUME /data/db

# Expose the ports for MongoDB
EXPOSE 27017
