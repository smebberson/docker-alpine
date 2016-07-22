FROM smebberson/alpine-nginx
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

# Add the files
ADD root /

RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log
