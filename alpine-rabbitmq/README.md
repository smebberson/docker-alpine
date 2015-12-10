alpine-rabbitmq
===================

__Please note__ this image is using Alpine's Erlang packages which are in its [edge](http://wiki.alpinelinux.org/wiki/Edge) (testing) repo!

An image for using [RabbitMQ][RabbitMQ], bundled with [Alpine Linux][alpinelinux] and [s6][s6].

Usage
-----

To use this image include `FROM smebberson/alpine-rabbitmq` at the top of your `Dockerfile`. Inheriting from `smebberson/alpine-rabbitmq` provides you with the ability to easily start your RabbitMQ server using s6. s6 will also keep it running for you, restarting it when it crashes.

When you run this container, s6 will automatically start your RabbitMQ server and make sure it stays running for you.

### Configurations

Basic configuration via a few environment variables have been baked into this image.

- `RABBITMQ_TCP_LISTENERS` to configure the `tcp_listeners` configuration.
- `RABBITMQ_SSL_LISTENERS` to configure the `ssl_listeners` configuration.
- `RABBITMQ_SSL_CERT_FILE`, `RABBITMQ_SSL_KEY_FILE` and `RABBITMQ_SSL_CA_FILE` to configure via the `ssl_options` configuration.
- `RABBITMQ_SSL_VERIFY` to customise the `ssl_verify` configuration; defaults to `verify`.
- `RABBITMQ_SSL_FAIL` to customise the `ssl_fail` configuration; defaults to `true`.
- `RABBITMQ_DEFAULT_VHOST` to configure the `default_vhost` configuration.
- `RABBITMQ_USER` and `RABBITMQ_PASS` to configure the `default_user` and `default_pass` configurations.
- `RABBITMQ_LOOPBACK_USERS` to configure the `loopback_users` configuration.

You can also provide a custom [RabbitMQ configuration][RabbitMQConfig] file by adding the file at `/etc/rabbitmq/rabbitmq.config`.

Only ports 5672/tcp 15672/tcp are exposed.

#### RabbitMQ Management Plugin

The RabbitMQ management plugin is disabled by default, however, it's quite simple to enable. Add an environment of `RABBITMQ_ENABLE_MANAGEMENT_PLUGIN` (set to anything). This will enable the management plugin, with the default configuration.

If the `RABBITMQ_SSL_CERT_FILE`, `RABBITMQ_SSL_KEY_FILE` and `RABBITMQ_SSL_CA_FILE` environment variables are defined, they'll be used to automatically enable SSL for the management plugin UI. If you'd like to have a different set of SSL certificates for the management plugin, you can do so by setting the following environment variables `RABBITMQ_MGMT_SSL_CERT_FILE`, `RABBITMQ_MGMT_SSL_KEY_FILE` and `RABBITMQ_MGMT_SSL_CA_FILE`.

You can access the mangement UI admin via http(s)://server-name:15672. See above for login details.
For more info see [RabbitMQ documentations][RabbitMQManagement].

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
