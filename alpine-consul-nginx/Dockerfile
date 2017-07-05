FROM smebberson/alpine-consul-base:4.2.0
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

# Install nginx
RUN echo "http://dl-4.alpinelinux.org/alpine/v3.3/main" >> /etc/apk/repositories && \
    apk upgrade --update --no-cache && \
    apk add --update --no-cache nginx=1.8.1-r1 && \
    rm -rf /var/cache/apk/* && \
    chown -R nginx:www-data /usr/share/nginx && \
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log && \
    addgroup consul-template nginx

# Add the files
COPY root /

# Setup permissions to allow consul-template to manage nginx
RUN mkdir /etc/services.d/nginx/supervise/ && \
    mkfifo /etc/services.d/nginx/supervise/control && \
    chown -R root:s6 /etc/services.d/nginx/ && \
    chmod g+w /etc/services.d/nginx/supervise/control

# Expose the ports for nginx
EXPOSE 80 443
