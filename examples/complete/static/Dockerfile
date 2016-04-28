FROM smebberson/alpine-consul-nginx
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

# Add the files.
ADD root /

# Update the permissions.
RUN chown -R nginx:www-data /var/lib/nginx
