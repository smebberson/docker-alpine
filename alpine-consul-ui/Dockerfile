FROM smebberson/alpine-consul:1.0.0
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

ENV CONSUL_VERSION=0.5.2

# Download and install Consul UI
RUN apk add --update curl && \
    curl -sSL -o /tmp/consul_web_ui.zip https://releases.hashicorp.com/consul/{$CONSUL_VERSION}/consul_{$CONSUL_VERSION}_web_ui.zip && \
    cd /tmp && \
    unzip consul_web_ui.zip && \
    mkdir /ui && \
    mv dist/* /ui && \
    chown -R consul:consul /ui && \
    apk del --purge curl && \
    rm -rf /var/cache/apk/* consul_web_ui.zip

# Add the files
ADD root /

# Expose the web ui port
EXPOSE 8500
