FROM smebberson/alpine-consul:3.2.0
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

ENV CONSUL_TEMPLATE_VERSION=0.19.0 \
    CONSUL_DATA_DIR=/data/consul \
    CONSUL_CONFIG_DIR=/etc/consul/conf.d

# Download and install Consul Template
RUN apk upgrade --update --no-cache && \
    apk add --update --no-cache curl && \
    curl -sLo /tmp/consul-template.zip https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip && \
    unzip -d /usr/sbin/ /tmp/consul-template.zip && \
    rm /tmp/consul-template.zip && \
    apk del curl && \
    addgroup consul-template && \
    adduser -D -g "" -s /bin/sh -G consul-template consul-template && \
    addgroup s6 && \
    addgroup consul s6 && \
    addgroup consul-template s6

# Add the files
ADD root /

# For `s6-svc -h` to work properly we want to set proper group permissions
# see: https://github.com/just-containers/s6-overlay/issues/130#issuecomment-181956795
# Also fix permissions
RUN mkdir /etc/services.d/consul-template/supervise/ && \
    mkfifo /etc/services.d/consul-template/supervise/control && \
    chown -R root:s6 /etc/services.d/consul-template && \
    chmod g+w /etc/services.d/consul-template/supervise/control /etc/services.d/consul-template
