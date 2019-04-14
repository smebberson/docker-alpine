FROM smebberson/alpine-nodejs
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

RUN apk --no-cache --update add ca-certificates && \
    update-ca-certificates

# Build the npm modules.
ADD root/app/package.json /app/package.json
RUN cd /app && npm install --production

# Add the remaining source (excluding `root/app/node_modules` thanks to `.dockerignore`).
ADD root /

CMD ["/etc/start"]
