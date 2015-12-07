FROM smebberson/alpine-base:1.2.0
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

ENV CONSUL_VERSION=0.5.2 GOMAXPROCS=2 CONSUL_TEMPLATE_VERSION=0.11.1

# Download and install Consul
# We are building it ourselves, because Alpine Linux doesn't use glibc
RUN export GOPATH=/go && \
    apk add --update go git gcc musl-dev make bash && \
    go get github.com/hashicorp/consul && \
    cd $GOPATH/src/github.com/hashicorp/consul && \
    git checkout -q --detach "v$CONSUL_VERSION" && \
    make && \
    mv bin/consul /bin && \
    rm -rf $GOPATH && \
    apk del go git gcc musl-dev make bash && \
    rm -rf /var/cache/apk/* && \
    addgroup consul && \
    adduser -D -G consul consul && \
    mkdir -p /data/consul && \
    chown -R consul:consul /data/consul    

# Download and install Consul Template
RUN apk add --update openssl && \
  wget -q -O /tmp/consul-template.zip https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip && \
  unzip -d /usr/sbin/ /tmp/consul-template.zip && \
  rm /tmp/consul-template.zip && \
  apk del openssl && \
  rm -rf /var/cache/apk/*

# Add the files
ADD root /

VOLUME ["/data/consul"]

EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 53 53/udp
