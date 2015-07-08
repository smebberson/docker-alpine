FROM smebberson/alpine-consul-nginx
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

# Install Node.js, and the latest version of npm (and Python in case any npm modules require building)
RUN apk add --update nodejs git python make && \
    rm -rf /var/cache/apk/* && \
    npm install -g npm
