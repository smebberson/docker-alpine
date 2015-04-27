FROM alpine:3.1
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

# Add commonly used packages
RUN apk add --update bind-tools && \
    rm -rf /var/cache/apk/*

# Add s6-overlay
ENV S6_OVERLAY_VERSION v1.9.1.3

ADD https://github.com/just-containers/s6-overlay/releases/download/${S6_OVERLAY_VERSION}/s6-overlay-amd64.tar.gz /tmp/s6-overlay.tar.gz
RUN tar xvfz /tmp/s6-overlay.tar.gz -C /

ADD root /

ENTRYPOINT ["/init"]
CMD []
