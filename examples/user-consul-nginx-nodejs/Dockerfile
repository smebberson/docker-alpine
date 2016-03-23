FROM smebberson/alpine-consul-nginx-nodejs
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

ENV NODE_ENV=development \
	NODE_PORT=4000

# Add image source
ADD root /

RUN cd /app && \
    npm install --production
