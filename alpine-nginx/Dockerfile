FROM smebberson/alpine-base:1.2.0
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

# Install nginx
RUN apk --no-cache add nginx=1.8.0-r1 && \
    chown -R nginx:www-data /var/lib/nginx

# Add the files
ADD root /

# Expose the ports for nginx
EXPOSE 80 443
