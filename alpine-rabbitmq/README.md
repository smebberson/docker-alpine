# alpine-rabbitmq

__Please note__ this image is using Alpine's Erlang packages which are in its [community](https://pkgs.alpinelinux.org/packages?name=%25erlang%25&repo=community&arch=x86_64&maintainer=all) repo.

An image for using [RabbitMQ][RabbitMQ], bundled with [Alpine Linux][alpinelinux] and [s6][s6].

## Features

This image features:

- [Alpine Linux][alpinelinux]
- [s6][s6] and [s6-overlay][s6overlay]
- [confd][confd]

## Versions

- `1.0.0` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/master/alpine-rabbitmq/Dockerfile)

[See VERSIONS.md for image contents.](https://github.com/smebberson/docker-alpine/blob/master/alpine-rabbitmq/VERSIONS.md)

## Usage

To use this image include `FROM smebberson/alpine-rabbitmq` at the top of your `Dockerfile`. Inheriting from `smebberson/alpine-rabbitmq` provides you with the ability to easily start your RabbitMQ server using s6. s6 will monitor it for you. The container will restart if RabbitMQ were to fail.

### Configuration

This comes with `confd` and is used to provide easy configuration. Please not, not all RabbitMQ configuration options are supported. Please submit a pull request if you require an option.

Basic configuration via a few environment variables have been baked into this image.

- `RABBITMQ_TCP_LISTENERS` to configure the `tcp_listeners` configuration.
- `RABBITMQ_SSL_LISTENERS` to configure the `ssl_listeners` configuration.
- `RABBITMQ_SSL_CERT_FILE`, `RABBITMQ_SSL_KEY_FILE` and `RABBITMQ_SSL_CA_FILE` to configure via the `ssl_options` configuration.
- `RABBITMQ_SSL_DEPTH` to configure the `ssl_options.depth` configuration.
- `RABBITMQ_SSL_VERIFY` to customise the `ssl_options.verify` configuration; defaults to `verify_peer`.
- `RABBITMQ_SSL_FAIL` to customise the `ssl_options.fail_if_no_peer_cert` configuration; defaults to `true`.
- `RABBITMQ_DEFAULT_VHOST` to configure the `default_vhost` configuration.
- `RABBITMQ_USER` and `RABBITMQ_PASS` to configure the `default_user` and `default_pass` configurations.
- `RABBITMQ_LOOPBACK_USERS` to configure the `loopback_users` configuration.
- `RABBITMQ_ENABLE_MANAGEMENT_PLUGIN` to enable the `rabbitmq_management` configuration. Set to `true`.
- `RABBITMQ_MGMT_SSL_CERT_FILE`, `RABBITMQ_MGMT_SSL_KEY_FILE` and `RABBITMQ_MGMT_SSL_CA_FILE` to configure the `rabbitmq_management.ssl_opts` configuration.
- `RABBITMQ_MGMT_PORT` to enable the `rabbitmq_management.port` configuration; defaults to `15672`.

You can completely update the configuration by replacing `/etc/confd/templates/rabbitmq.tmpl` with a variation of your own.

Only ports 5672/tcp 15672/tcp are exposed.

#### RabbitMQ Management Plugin

The RabbitMQ management plugin is disabled by default, however, it's quite simple to enable. Add an environment of `RABBITMQ_ENABLE_MANAGEMENT_PLUGIN` (set to `true`). This will enable the management plugin, with the default configuration.

If the `RABBITMQ_SSL_CERT_FILE`, `RABBITMQ_SSL_KEY_FILE` and `RABBITMQ_SSL_CA_FILE` environment variables are defined, they'll be used to automatically enable SSL for the management plugin UI. If you'd like to have a different set of SSL certificates for the management plugin, you can do so by setting the following environment variables `RABBITMQ_MGMT_SSL_CERT_FILE`, `RABBITMQ_MGMT_SSL_KEY_FILE` and `RABBITMQ_MGMT_SSL_CA_FILE`.

You can access the management UI admin via http(s)://server-name:15672. For more info see [RabbitMQ documentations][RabbitMQManagement].

### Run RabbitMQ server

You can start up your RabbitMQ server using the following command:

```
docker run -d -p 5672:5672 -p 15672:15672 smebberson/alpine-rabbitmq
```

### Run RabbitMQ server with persistent shared directories

```
docker run -d -p 5672:5672 -p 15672:15672 -v <log-dir>:/data/log -v <data-dir>:/data/mnesia smebberson/alpine-rabbitmq
```

**Please note:** To utilise the persistent shared directories, please make sure you have included the `VOLUME` command in your `Dockerfile` and environment variables as defined in the configurations outlined above.


[s6]: http://www.skarnet.org/software/s6
[alpinelinux]: http://www.alpinelinux.org/about
[RabbitMQ]: https://www.rabbitmq.com
[RabbitMQManagement]: https://www.rabbitmq.com/management.html
[RabbitMQConfig]: https://www.rabbitmq.com/configure.html
