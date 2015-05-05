FROM smebberson/alpine-consul-base
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

# Install Node.js (and Python in case any npm modules require building)
RUN apk add --update nodejs git python make && \
    rm -rf /var/cache/apk/*
