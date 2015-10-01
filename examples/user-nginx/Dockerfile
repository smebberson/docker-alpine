FROM smebberson/alpine-nginx:2.0.0
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

# Add the files
ADD root /

RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log
