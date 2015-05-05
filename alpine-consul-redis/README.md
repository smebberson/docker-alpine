alpine-consul-redis
===================

An image for using [redis][redis], bundled with [Alpine Linux][alpinelinux] and [s6][s6] and [Consul][consul].

This image is perfect if you're looking to run redis within a Docker setup and wanting to benefit from Consul for service registration and discovery.

**_Yet another container for running redis?_**

Yes, but this one is built from [smebberson/alpine-consul-base][alpineconsulbase] that contains [s6][s6] for process management, and Consul for service registration and discovery. Small, fast and flexible.

_**Aren't you only supposed to run one process per container?**_

Hell no! The following are good examples of when multiple processes within one container might be necessary:

- Automatically updating [nginx][nginx] proxy settings when a down-stream application server (nodejs, php, etc) restarts (and the IP changes).
- Automatically updating [HAProxy][haproxy] configuration to load balance to a group of down-stream application servers.
- Running a logging daemon to centralize log management (i.e. [logentries][logentries], [loggly][loggly], [logstash][logstash]).
- When you need to run a script on application server crash (to tidy something up), as the standard [Docker container restart policies][drsp] won't provide this.

In all of these instances, there is one primary services and secondary support services. When the secondary support services fail, they should be automatically restarted. When the primary service fails, the container itself should restart.

Usage
-----

To use this image include `FROM smebberson/alpine-consul-redis` at the top of your `Dockerfile`, or simply `docker run --name redis --link alpine-consul:consul-agent smebberson/alpine-consul-redis`.

You need to a link to another container running Consul, so this container can join the cluster. It should have a link name of `consul-agent`.

Customisation
-------------

This container comes setup as follows:

- s6 will automatically start redis for you.
- If redis dies, so will the container.
- A basic redis configuration which you can [review and customise][redisconfig].

To update the configuration:

- Create a file called `redis-local.conf`, fill it with all of the config overrides that you require.
- In your `Dockerfile`, copy this file to `/etc/redis-local.conf`.

Redis will start and load the config at `/etc/redis.conf`, and then load `/etc/redis-local.conf` and apply any overrides.

### Consul service registration

This container is automatically configured to register itself with Consul, as the `redis` service operating on port `6379`. It comes with a script `/usr/bin/redis-check`, that is wired up to a Consul service health check.

Any of these files can be changed in your image, as required to customise the setup.

[s6]: http://www.skarnet.org/software/s6/
[logentries]: https://logentries.com/
[loggly]: https://www.loggly.com/
[logstash]: http://logstash.net/
[drsp]: https://docs.docker.com/reference/commandline/cli/#restart-policies
[redis]: http://redis.io/
[haproxy]: http://www.haproxy.org/
[alpineconsulbase]: https://registry.hub.docker.com/u/smebberson/alpine-consul-base/
[s6]: http://www.skarnet.org/software/s6/
[redisconfig]: https://github.com/smebberson/docker-alpine/blob/master/alpine-consul-redis/root/etc/redis.conf
