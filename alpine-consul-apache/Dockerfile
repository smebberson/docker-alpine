FROM smebberson/alpine-consul-base:3.0.0
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

# Install apache
RUN apk add --update --no-cache apache2=2.4.17-r4 apache2-utils=2.4.17-r4 && \
    sed -i 's/CustomLog logs\/access.log combined/CustomLog logs\/access.log combined env=!dontlog/g' /etc/apache2/httpd.conf && \
    mkdir -p /run/apache2/

# Add the files
ADD root /

# Expose the ports for apache
EXPOSE 80 443
