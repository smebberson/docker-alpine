# alpine-base

A base image for running just about anything within a container, based on Alpine Linux 3.2.

## Process management

This image includes [s6][s6] (via [s6-overlay][s6-overlay]), to make it super simple to start multiple process and manage them correctly.

_**Aren't you only supposed to run one process per container?**_ Well yes and no... the following are good examples of when multiple processes within one container might be necessary:

- automatically updating [nginx][nginx] proxy settings when a down-stream application server (nodejs, php, etc) restarts (and the IP changes)
- automatically updating [HAProxy][haproxy] configuration to load balance to a group of down-stream application servers
- running a logging daemon to centralize log management (i.e. [logentries][logentries], [loggly][loggly], [logstash][logstash])
- when you need to run a script on application server crash (to tidy something up), as the standard [Docker container restart policies][drsp] won't provide this

## DNS

Unfortunately, Alpine Linux does not support the `search` keyword in `resolv.conf`. This breaks many tools that rely on DNS service discovery, in particular, Kubernetes, Tutum.co, Consul.

To overcome these issues, `alpine-base` includes the lightweight container-only DNS server [go-dnsmasq][godnsmasq] to resolve these issues.

That means that Alpine Linux and all containers within this repository will now work with [Tutum service discovery and links](https://support.tutum.co/support/solutions/articles/5000012181-service-discovery-and-links) and [Kubernetes service discovery](https://github.com/kubernetes/kubernetes/blob/master/docs/user-guide/services.md#dns).

## Versions

- `1.3.0`, `latest` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/master/alpine-base/Dockerfile)
- `1.2.1` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/75cab08d781a9bfc681d6c8d6c45ba13a7d8a765/alpine-base/Dockerfile)
- `1.2.0` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/e630bad2eebad48231cb61b6139a0aa7603a5910/alpine-base/Dockerfile)
- `1.1.0` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/1f0d03677e8ebbcd59ff8209730089bcac79d23d/alpine-base/Dockerfile)
- `1.0.0` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/fdb9fca74d03ee1b21e47e3edd54f01cb4bf5ab6/alpine-base/Dockerfile)

[See VERSIONS.md for image contents.](https://github.com/smebberson/docker-alpine/blob/master/alpine-base/VERSIONS.md)

## Usage

To use this image include `FROM smebberson/alpine-base` at the top of your `Dockerfile`. Starting from `smebberson/alpine-base` provides you with the ability to easily start any service using s6. s6 will also keep it running for you, restarting it when it crashes.

To start your service using s6:

- create a folder at `/etc/services.d/service-name`
- create a file in your new folder called `run` and give it execute permissions
- inside that file start your service, for example:

```
#!/usr/bin/env bash

# start nginx
exec nginx;
```

### Finish scripts

If you want to run a script when your application stops, simply:

- create a file in your `/etc/services.d/service-name` folder called `finish` and give it execute permissions

In this file, do whatever you need to, but keep it quick and simple (anything over 3 seconds and s6 will force quit it). Once this script has run, s6 will call `/etc/services.d/service-name/run` again to restart your service.

There is also further [information about how to use CMD][s6-overlay-cmd] with s6-overlay.

### Crashes, logs, no-restarts?

[s6 has a number of other options][s6-servicedir] that you can use to customise what happens when your process suddenly dies. [s6-overlay][s6-overlay] also has a guide to [customising s6][customising-s6-overlay] (when using [s6-overlay][s6-overlay]).

## Examples

An example of using this image can be found in the [smebberson/nodejs][smebbersonnodejs] [Dockerfile][smebbersonnodejsdockerfile].

[s6]: http://www.skarnet.org/software/s6/
[s6-servicedir]: http://www.skarnet.org/software/s6/servicedir.html
[s6-overlay]: https://github.com/just-containers/s6-overlay
[customising-s6-overlay]: https://github.com/just-containers/s6-overlay#customizing-s6-behaviour
[s6-overlay-cmd]: https://github.com/just-containers/s6-overlay#usage
[logentries]: https://logentries.com/
[loggly]: https://www.loggly.com/
[logstash]: http://logstash.net/
[drsp]: https://docs.docker.com/reference/commandline/cli/#restart-policies
[nginx]: http://nginx.org/
[haproxy]: http://www.haproxy.org/
[smebbersonnodejs]: https://registry.hub.docker.com/u/smebberson/nodejs/
[smebbersonnodejsdockerfile]: https://github.com/smebberson/docker-ubuntu-base/blob/master/nodejs/Dockerfile
[godnsmasq]: https://github.com/janeczku/go-dnsmasq
