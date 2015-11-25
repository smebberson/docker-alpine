FROM smebberson/alpine-consul-base:1.0.0
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

# Install nginx
RUN apk add --update nginx && \
    rm -rf /var/cache/apk/* && \
    chown -R nginx:www-data /var/lib/nginx && \
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

# Add the files
ADD root /

# Expose the ports for nginx
EXPOSE 80 443
