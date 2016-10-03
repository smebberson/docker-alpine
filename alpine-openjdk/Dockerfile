FROM smebberson/alpine-base
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

# Taken from openjdk/7-jdk/alpine/Dockerfile
# A few problems with compiling Java from source:
#  1. Oracle. Licensing prevents us from redistributing the official JDK.
#  2. Compiling OpenJDK also requires the JDK to be installed, and it gets
#     really hairy.

# Default to UTF-8 file.encoding
ENV LANG C.UTF-8

# add a simple script that can auto-detect the appropriate JAVA_HOME value
# based on whether the JDK or only the JRE is installed
RUN { \
        echo '#!/bin/sh'; \
        echo 'set -e'; \
        echo; \
        echo 'dirname "$(dirname "$(readlink -f "$(which javac || which java)")")"'; \
    } > /usr/local/bin/docker-java-home \
    && chmod +x /usr/local/bin/docker-java-home
ENV JAVA_HOME /usr/lib/jvm/java-1.7-openjdk
ENV PATH $PATH:/usr/lib/jvm/java-1.7-openjdk/jre/bin:/usr/lib/jvm/java-1.7-openjdk/bin

ENV JAVA_VERSION 7u91
ENV JAVA_ALPINE_VERSION 7.91.2.6.3-r2

RUN set -x \
    && apk add --no-cache \
        java-cacerts \
        openjdk7="$JAVA_ALPINE_VERSION" \
    && [ "$JAVA_HOME" = "$(docker-java-home)" ]

# fix broken cacerts in OpenJDK 7 on alpine
# see https://bugs.alpinelinux.org/issues/4128
RUN rm -f "$JAVA_HOME"/jre/lib/security/cacerts \
    && ln -sf /etc/ssl/certs/java/cacerts "$JAVA_HOME"/jre/lib/security/cacerts
