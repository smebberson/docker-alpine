FROM smebberson/alpine-base
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

# Install nginx and have logs handle the s6-overlay way
RUN apk add --update nginx && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /tmp/nginx && \
    chown -R nginx:www-data /tmp/nginx

# Add the files
ADD root /
RUN rm /etc/s6/services/s6-fdholderd/down

# Expose the ports for nginx
EXPOSE 80 443
