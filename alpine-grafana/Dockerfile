FROM smebberson/alpine-confd:1.0.1
MAINTAINER Scott Mebberson <scott@scottmebberson.com>

ENV GRAFANA_VERSION=2.6.0 GOMAXPROCS=2

RUN export GOPATH=/go && \
    echo "http://dl-2.alpinelinux.org/alpine/latest-stable/community" >> /etc/apk/repositories && \
    apk add --update go=1.5.2-r0 git musl-dev curl nodejs gcc && \
    go get github.com/grafana/grafana && \
    cd $GOPATH/src/github.com/grafana/grafana && \
    git checkout -q --detach "v${GRAFANA_VERSION}" && \
    go run build.go setup && \
    $GOPATH/bin/godep restore && \
    go build . && \
    npm install -g npm && \
    npm install -g grunt-cli && \
    npm install && \
    grunt && \
    mkdir -p /usr/share/grafana/data/log /data/grafana/logs /etc/grafana && \
    chmod +x ./grafana && \
    mv ./grafana /bin/grafana-server && \
    cp -ra ./public_gen /usr/share/grafana/public && \
    cp -ra ./conf /usr/share/grafana && \
    go clean -i -r && \
    apk del go git musl-dev curl nodejs gcc && \
    rm -rf /var/cache/apk/* $GOPATH /tmp/* /root/.n* && \
    addgroup grafana && \
    adduser -D -G grafana grafana

# Add the files
ADD root /

VOLUME ["/data/grafana"]

EXPOSE 3000
