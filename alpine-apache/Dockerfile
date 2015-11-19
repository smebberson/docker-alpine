FROM smebberson/alpine-base:1.1.0
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

# Install apache
RUN apk add --update apache2 apache2-utils && \
    rm -rf /var/cache/apk/* && \
    ln -sf /dev/stdout /var/log/apache2/access.log && \
    ln -sf /dev/stderr /var/log/apache2/error.log

# Add the files
ADD root /

# Expose the ports for apache
EXPOSE 80 443
