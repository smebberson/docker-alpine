Place your templates in sub folders so that if you create volumes for those templates you do not break other templates from other volumes.

For example in your Dockerfile you would do this:
```
FROM smebberson/alpine-consul-base

ADD my-template.ctmpl /etc/consul-template/templates/my-service/my-template.ctmpl
ADD my-configuration.conf /etc/consul-template/conf.d/my-service/my-configuration.conf

VOLUME /etc/consul-template/templates/my-service /etc/consul-template/conf.d/my-service
```