FROM smebberson/alpine-consul-nodejs
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

ENV NODE_ENV=development \
    NODE_PORT=4000

# Add image source
ADD root /

USER nodejs

RUN cd /app && \
    npm install --production

USER root
