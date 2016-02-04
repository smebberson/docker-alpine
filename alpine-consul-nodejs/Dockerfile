FROM smebberson/alpine-consul-base
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

# Install Node.js, and the latest version of npm (and Python in case any npm modules require building)
RUN apk --no-cache add nodejs git python make && \
    npm install -g npm
