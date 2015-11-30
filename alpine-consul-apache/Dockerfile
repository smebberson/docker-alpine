FROM smebberson/alpine-consul-base
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

# Install apache
RUN apk add --update apache2 apache2-utils && \
    rm -rf /var/cache/apk/* && \
    sed -i 's/CustomLog logs\/access.log combined/CustomLog logs\/access.log combined env=!dontlog/g' /etc/apache2/httpd.conf

# Add the files
ADD root /

# Expose the ports for apache
EXPOSE 80 443
