FROM smebberson/alpine-confd:3.0.0
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

#
# This has been adapted from https://github.com/docker-library/php/tree/master/7.0/fpm/alpine
# But uses s6 to provide a multi-process PHP container with Alpine.
#

# Setup environment variables.
ENV PHP_INI_DIR=/usr/local/etc/php \
    PHP_VERSION=5.6.28 \
    GPG_KEYS="0BD78B5F97500D450838F95DFE857D9A90D90EC1 6E4F6AB321FDC07F2C332E3AC2BF0BC433CFC8B3" \
    PHP_SHA256=07187ba2870f89cef334cd2ad6cb801aeec5eaf283da0293a9a6be75d6786d11

# Add the files neccessary for installing PHP.
COPY ./root/usr/bin/docker-php-* /usr/bin/

# Grab the PHP source.
RUN set -xe && \
    apk add --update --no-cache --virtual .persistent-deps ca-certificates curl tar xz && \
    # Use the following to determine the php-rundeps: scanelf --needed --nobanner --recursive /usr/local | awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' | sort -u | xargs -r apk info --installed | sort -u
    apk add --no-cache --virtual .php-rundeps libcrypto1.0 libcurl libedit libssl1.0 libxml2 musl ncurses-libs zlib gdb && \
    apk add --no-cache --virtual .build-deps autoconf file g++ gcc libc-dev make pkgconf re2c curl-dev libedit-dev libxml2-dev openssl-dev sqlite-dev && \
    apk add --no-cache --virtual .fetch-deps gnupg && \
    addgroup -g 82 -S www-data && \
    adduser -u 82 -D -S -G www-data www-data && \
    mkdir -p $PHP_INI_DIR/conf.d && \
    mkdir -p /usr/src && \
    mkdir -p /var/log/php-fpm && \
    chown -Rf www-data:www-data /var/log/php-fpm && \
    cd /usr/src && \
    curl -fSL "https://secure.php.net/get/php-$PHP_VERSION.tar.xz/from/this/mirror" -o php.tar.xz && \
    echo "$PHP_SHA256 *php.tar.xz" | sha256sum -c - && \
    curl -fSL "https://secure.php.net/get/php-$PHP_VERSION.tar.xz.asc/from/this/mirror" -o php.tar.xz.asc && \
    export GNUPGHOME="$(mktemp -d)" && \
    for key in $GPG_KEYS; do \
        gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$key"; \
    done && \
    gpg --batch --verify php.tar.xz.asc php.tar.xz && \
    rm -r "$GNUPGHOME" && \
    # Install PHP.
    # --enable-ftp is included here because ftp_ssl_connect() needs ftp to be compiled statically (see https://github.com/docker-library/php/issues/236)
    # --enable-mbstring is included here because otherwise there's no way to get pecl to use it properly (see https://github.com/docker-library/php/issues/195)
    # --enable-mysqlnd is included here because it's harder to compile after the fact than extensions are (since it's a plugin for several extensions, not an extension in itself)
    docker-php-source extract && \
    cd /usr/src/php && \
    ./configure --enable-debug --with-config-file-path="$PHP_INI_DIR" --with-config-file-scan-dir="$PHP_INI_DIR/conf.d" --disable-cgi --enable-ftp --enable-mbstring --enable-mysqlnd --with-curl --with-libedit --with-openssl --with-zlib --enable-fpm --with-fpm-user=www-data --with-fpm-group=www-data && \
    make -j 6 && \
    make install && \
    { find /usr/local/bin /usr/local/sbin -type f -perm +0111 -exec strip --strip-all '{}' + || true; } && \
    make clean && \
    docker-php-source delete && \
    apk del .build-deps .fetch-deps

# Add the files
ADD root /

# Expose the port in which PHP FPM will use.
EXPOSE 9000
