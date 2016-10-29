FROM smebberson/alpine-consul-base:4.1.0
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

# Install apache
RUN apk upgrade --update --no-cache && \
    apk add --update --no-cache apache2=2.4.23-r1 apache2-utils=2.4.23-r1 && \
    rm -rf /var/cache/apk/* && \
    sed -i 's/CustomLog logs\/access.log combined/CustomLog logs\/access.log combined env=!dontlog/g' /etc/apache2/httpd.conf && \
    mkdir -p /run/apache2/

# Add the files
ADD root /

# Expose the ports for apache
EXPOSE 80 443
