FROM smebberson/alpine-consul-nginx-nodejs
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

ENV NODE_ENV=development NODE_PORT=4000

# Build the Node.js modules on the container itself
ADD root/app/package.json /tmp/package.json
RUN cd /tmp && npm install --production

# Add image source
ADD root /

# Replace the node_modules with those built on the image
RUN rm -rf /app/node_modules && cp -r /tmp/node_modules /app/node_modules
