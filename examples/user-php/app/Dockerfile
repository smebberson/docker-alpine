FROM smebberson/alpine-php-debug
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

ENV PHP_FPM_DEFAULT_INI_MEMORY_LIMIT=64M

# Add the files.
ADD root /

# Make debugging easier.
RUN ln -sf /dev/stdout /var/log/php-fpm/access.log && \
    ln -sf /dev/stderr /var/log/php-fpm/error.log

EXPOSE 9000
