FROM smebberson/alpine-consul-base:1.1.0
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

# Install apache
RUN apk add --update apache2=2.4.16-r0 apache2-utils=2.4.16-r0 && \
    rm -rf /var/cache/apk/* && \
    sed -i 's/CustomLog logs\/access.log combined/CustomLog logs\/access.log combined env=!dontlog/g' /etc/apache2/httpd.conf

# Add the files
ADD root /

# Expose the ports for apache
EXPOSE 80 443
