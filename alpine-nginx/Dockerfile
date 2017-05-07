FROM smebberson/alpine-base:3.0.0
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

# Install nginx
RUN echo "http://dl-4.alpinelinux.org/alpine/v3.3/main" >> /etc/apk/repositories && \
    apk add --update nginx=1.8.1-r1 && \
    rm -rf /var/cache/apk/* && \
    chown -R nginx:www-data /var/lib/nginx

# Add the files
ADD root /

# link the logs to stdout/stderr so they get surfaced to docker
RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log
