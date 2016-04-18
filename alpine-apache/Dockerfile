FROM smebberson/alpine-base:2.0.0
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

# Install apache
RUN apk add --no-cache apache2=2.4.17-r4 apache2-utils=2.4.17-r4

# Add the files
ADD root /

# Expose the ports for apache
EXPOSE 80 443
