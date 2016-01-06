FROM smebberson/alpine-grafana:dev
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

# Install nginx
RUN apk add --update nginx=1.8.0-r1 && \
    rm -rf /var/cache/apk/* && \
    chown -R nginx:www-data /var/lib/nginx

# Add the files
ADD root /

VOLUME ["/data/grafana"]

# Expose the ports for nginx
EXPOSE 80 443
