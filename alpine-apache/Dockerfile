FROM smebberson/alpine-base:3.2.0
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

# Install apache
RUN apk add --no-cache apache2=2.4.27-r0 apache2-utils=2.4.27-r0

# Add the files
ADD root /

# Expose the ports for apache
EXPOSE 80 443
