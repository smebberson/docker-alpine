FROM smebberson/alpine-nginx-nodejs
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

ENV NODE_ENV=development NODE_PORT=4000

# Stream the nginx logs to stdout and stderr
RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

# Build the npm modules
ADD root/app/package.json /app/package.json
RUN cd /app && npm install --production

# Add the files (works with .dockerignore to exclude /app/node_modules, so the above npm build isn't replaced)
ADD root /
