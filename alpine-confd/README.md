# alpine-confd

A Docker image for running [confd][confd], based on Alpine Linux.
This image belongs to a suite of images [documented here][dockeralpine].

## Features

This image features:

- [Alpine Linux][alpinelinux]
- [s6][s6] and [s6-overlay][s6overlay]
- [confd][confd]

## Versions

- `2.0.0`, `latest` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-confd-v2.0.0/alpine-confd/Dockerfile)
- `1.0.2` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-confd-v1.0.2/alpine-confd/Dockerfile)
- `1.0.1` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-confd-v1.0.1/alpine-confd/Dockerfile)
- `1.0.0` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-confd-v1.0.0/alpine-confd/Dockerfile)

[See VERSIONS.md for image contents.](https://github.com/smebberson/docker-alpine/blob/master/alpine-confd/VERSIONS.md)

## Usage

To use this image include `FROM smebberson/alpine-confd` at the top of your `Dockerfile`, or simply `docker run --name confd smebberson/alpine-confd`.

By default, this container doesn't actually do anything other than provide the building blocks for a Docker container that includes configuration management via confd.

A good pattern to running confd is to take advantage of container initialization hooks, and run confd before any service starts, creating the necessary configuration files.

```
#!/usr/bin/with-contenv sh

# Setup the templates.
confd -onetime -backend env
```

### Template resource configs

Add your template resource config files in `/etc/confd/conf.d/`. For example:

```
# /etc/confd/conf.d/test.toml

[template]
src = "test.conf.tmpl"
dest = "/tmp/test.conf"

```

### Source templates

Add your source templates in `/etc/confd/templates`. For example:

```
# this is a test only
test_variable = "{{getenv "test_variable"}}"
```

## Example

An example of using this image can be found in [examples/user-confd][alpineconfdexample].

[s6]: http://www.skarnet.org/software/s6/
[s6overlay]: https://github.com/just-containers/s6-overlay
[confd]: https://github.com/kelseyhightower/confd
[alpinelinux]: http://www.alpinelinux.org/
[alpineconfdexample]: https://github.com/smebberson/docker-alpine/blob/master/examples/user-confd/Dockerfile
[dockeralpine]: https://github.com/smebberson/docker-alpine
