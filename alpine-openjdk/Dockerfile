FROM smebberson/alpine-base:3.1.0
MAINTAINER G. Richard Bellamy (https://github.com/smebberson/docker-alpine)

# Taken from openjdk/8-jdk/alpine/Dockerfile
# A few problems with compiling Java from source:
#  1. Oracle.  Licensing prevents us from redistributing the official JDK.
#  2. Compiling OpenJDK also requires the JDK to be installed, and it gets
#       really hairy.

# Default to UTF-8 file.encoding
ENV LANG=C.UTF-8 \
    JAVA_VERSION=8u92 \
    JAVA_ALPINE_VERSION=8.111.14-r0 \
    JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk \
    PATH=$PATH:/usr/lib/jvm/java-1.8-openjdk/jre/bin:/usr/lib/jvm/java-1.8-openjdk/bin

# add a simple script that can auto-detect the appropriate JAVA_HOME value
# based on whether the JDK or only the JRE is installed
RUN { \
        echo '#!/bin/sh'; \
        echo 'set -e'; \
        echo; \
        echo 'dirname "$(dirname "$(readlink -f "$(which javac || which java)")")"'; \
    } > /usr/local/bin/docker-java-home && \
    chmod +x /usr/local/bin/docker-java-home

RUN set -x \
    apk upgrade --update && \
    apk add --no-cache openjdk8="$JAVA_ALPINE_VERSION" && \
    [ "$JAVA_HOME" = "$(docker-java-home)" ]
