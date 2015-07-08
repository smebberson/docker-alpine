FROM smebberson/alpine-consul
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

ENV CONSUL_VERSION=0.5.2

# Download and install Consul-ui
ADD https://dl.bintray.com/mitchellh/consul/${CONSUL_VERSION}_web_ui.zip /tmp/consul_web_ui.zip
RUN cd /tmp && \
    unzip consul_web_ui.zip && \
    mkdir /ui && \
    mv dist/* /ui && \
    chown -R consul:consul /ui && \
    rm consul_web_ui.zip

# Add the files
ADD root /

# Expose the web ui port
EXPOSE 8500
