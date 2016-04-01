# alpine-redis

An image for using [redis][redis], bundled with Alpine Linux and s6.

**_Yet another container for running nginx?_**

Yes, but this one is built from [smebberson/alpine-base][alpinebase] that contains [s6][s6] for process management. Small, fast and with s6.

_**Aren't you only supposed to run one process per container?**_

Hell no! The following are good examples of when multiple processes within one container might be necessary:

- Automatically updating [nginx][nginx] proxy settings when a down-stream application server (nodejs, php, etc) restarts (and the IP changes).
- Automatically updating [HAProxy][haproxy] configuration to load balance to a group of down-stream application servers.
- Running a logging daemon to centralize log management (i.e. [logentries][logentries], [loggly][loggly], [logstash][logstash]).
- When you need to run a script on application server crash (to tidy something up), as the standard [Docker container restart policies][drsp] won't provide this.

In all of these instances, there is one primary services and secondary support services. When the secondary support services fail, they should be automatically restarted. When the primary service fails, the container itself should restart.

## Versions

- `1.0.0`, `latest` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-redis-v1.0.0/alpine-redis/Dockerfile)

[See VERSIONS.md for image contents.](https://github.com/smebberson/docker-alpine/blob/master/alpine-redis/VERSIONS.md)

## Usage

To use this image include `FROM smebberson/alpine-redis` at the top of your `Dockerfile`, or simply `docker run --name redis smebberson/alpine-redis`.

Redis logs (access and error logs) are automatically streamed to stdout.

## Customisation

This container comes setup as follows:

- s6 will automatically start redis for you.
- If redis dies, so will the container.
- A basic redis configuration which you can [review and customise][redisconfig].

To update the configuration:

- Create a file called `redis-local.conf`, fill it with all of the config overrides that you require.
- In your `Dockerfile`, copy this file to `/etc/redis-local.conf`.

Redis will start and load the config at `/etc/redis.conf`, and then load `/etc/redis-local.conf` and apply any overrides.

[s6]: http://www.skarnet.org/software/s6/
[logentries]: https://logentries.com/
[loggly]: https://www.loggly.com/
[logstash]: http://logstash.net/
[drsp]: https://docs.docker.com/reference/commandline/cli/#restart-policies
[redis]: http://redis.io/
[haproxy]: http://www.haproxy.org/
[alpinebase]: https://registry.hub.docker.com/u/smebberson/alpine-base/
[s6]: http://www.skarnet.org/software/s6/
[redisconfig]: https://github.com/smebberson/docker-alpine/blob/master/alpine-redis/root/etc/redis.conf
