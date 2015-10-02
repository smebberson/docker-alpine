FROM smebberson/alpine-nginx:2.0.0
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

# Install Node.js, and the latest version of npm (and Python in case any npm modules require building)
# RUN echo "@edge http://dl-4.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
#     apk add --update-cache nodejs@edge=4.1.0-r0 git python make && \
#     rm -rf /var/cache/apk/* && \
#     npm install -g npm

# Install Node.js, and the latest version of npm (and Python in case any npm modules require building)
RUN apk add --update git python make && \
    apk add nodejs --update-cache --allow-untrusted -X http://dl-4.alpinelinux.org/alpine/edge/main/ && \
    rm -rf /var/cache/apk/* && \
    npm install -g npm
