alpine-rabbitmq
===================

An image for using [RabbitMQ][RabbitMQ], bundled with [Alpine Linux][alpinelinux] and [s6][s6].

Usage
-----

To use this image include `FROM smebberson/alpine-rabbitmq` at the top of your `Dockerfile`. Inheriting from `smebberson/alpine-rabbitmq` provides you with the ability to easily start your RabbitMQ server using s6. s6 will also keep it running for you, restarting it when it crashes.

When you run this container, s6 will automatically start your RabbitMQ server and make sure it stays running for you.

### Configurations

You can configure the following settings in your Dockerfile:

```
# set username and password for default user login to access RabbitMQ
ENV RABBITMQ_USER={username} RABBITMQ_PASS={password}

# set paths for RabbitMQ data file if you would like to persist the data
ENV RABBITMQ_LOG_BASE="/data/log" RABBITMQ_MNESIA_BASE="/data/mnesia"

# create data directory and set permission for the /data (The server is set up to run as system user `rabbitmq`)
RUN mkdir -p /data/log /data/mnesia && \
    chown -R rabbitmq:rabbitmq /data

# Define mount points.
VOLUME ["/data/log", "/data/mnesia"]

```

**Please note:** If ```RABBITMQ_USER``` and ```RABBITMQ_PASS``` environment variables are not set, it will use the default RabbitMQ user logins which is ```guest``` as the username and as the password.

You can also provide a custom [RabbitMQ configuration][RabbitMQConfig] file by adding the file at `/etc/rabbitmq/rabbitmq.config`.

Only ports 5672/tcp 15672/tcp are exposed. If you require SSL configuration, expose the required ports in your local `Dockerfile`.

### RabbitMQ Management Plugin

You can access the mangement UI admin via http://server-name:15672. See above for login details.
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
