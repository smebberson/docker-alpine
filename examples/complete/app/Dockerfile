FROM smebberson/alpine-consul-nodejs:local
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

# Build the npm modules.
ADD root/app/package.json /app/package.json
RUN cd /app && npm install --production

# Add the remaining source (excluding `root/app/node_modules` thanks to `.dockerignore`).
ADD root /

# Listen on port 4000.
EXPOSE 4000
