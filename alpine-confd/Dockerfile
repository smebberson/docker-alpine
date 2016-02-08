FROM smebberson/alpine-base:1.2.1
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

ENV CONFD_VERSION=0.11.0

# Statically build confd for Alpine Linux :)
RUN echo "http://dl-2.alpinelinux.org/alpine/latest-stable/community" >> /etc/apk/repositories && \
    apk add --update go git gcc musl-dev && \
    git clone https://github.com/kelseyhightower/confd.git /src/confd && \
    cd /src/confd/src/github.com/kelseyhightower/confd/ && \
    GOPATH=/src/confd/vendor:/src/confd go build -a -installsuffix cgo -ldflags '-extld ld -extldflags -static' -x . && \
    mv ./confd /bin/ && \
    chmod +x /bin/confd && \
    apk del go git gcc musl-dev && \
    rm -rf /var/cache/apk/* /src
