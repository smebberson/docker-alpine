FROM smebberson/alpine-consul-base:dev
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

# Install nginx
RUN apk add --update nginx && \
    rm -rf /var/cache/apk/* && \
    chown -R nginx:www-data /var/lib/nginx && \
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log && \
    addgroup consul-template nginx

# Add the files
ADD root /

# Setup permissions to allow consul-template to manage nginx
RUN mkdir /etc/services.d/nginx/supervise/ && \
    mkfifo /etc/services.d/nginx/supervise/control && \
    chown -R root:s6 /etc/services.d/nginx/ && \
    chmod g+w /etc/services.d/nginx/supervise/control

# Expose the ports for nginx
EXPOSE 80 443
