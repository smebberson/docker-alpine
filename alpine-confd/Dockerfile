FROM smebberson/alpine-base:3.1.0
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

ENV CONFD_VERSION=0.11.0

# Statically build confd for Alpine Linux :)
RUN apk add --update --no-cache --virtual .confd-dependencies go git gcc musl-dev && \
    git clone https://github.com/kelseyhightower/confd.git /src/confd && \
    cd /src/confd && \
    git checkout -q --detach "v$CONFD_VERSION" && \
    cd /src/confd/src/github.com/kelseyhightower/confd && \
    GOPATH=/src/confd/vendor:/src/confd go build -a -installsuffix cgo -ldflags '-extld ld -extldflags -static' -x . && \
    mv ./confd /bin/ && \
    chmod +x /bin/confd && \
    apk del .confd-dependencies && \
    rm -rf /src
