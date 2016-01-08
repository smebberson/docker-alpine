FROM smebberson/alpine-consul
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

ENV CONSUL_TEMPLATE_VERSION=0.12.0

# Download and install Consul Template
RUN apk add --update openssl && \
    wget -q -O /tmp/consul-template.zip https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip && \
    unzip -d /usr/sbin/ /tmp/consul-template.zip && \
    rm /tmp/consul-template.zip && \
    apk del openssl && \
    rm -rf /var/cache/apk/*

# Add the files
ADD root /
