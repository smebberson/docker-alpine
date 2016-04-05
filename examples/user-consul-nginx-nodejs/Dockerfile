FROM smebberson/alpine-consul-nginx-nodejs
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

ENV NODE_ENV=development NODE_PORT=4000

# Build the Node.js modules on the container itself
ADD root/app/package.json /app/package.json
RUN cd /app && \
    npm install --production

# Add image source
ADD root /
