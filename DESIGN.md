docker-alpine
=============

These Docker images have been designed to make running multiple processes/services per container, simple!

_**Aren't you only supposed to run one process per container?**_

Hell no! The following are good examples of when multiple processes within one container might be necessary:

- Automatically updating [nginx][nginx] proxy settings when a down-stream application server (nodejs, php, etc) restarts (and the IP changes).
- Automatically updating [HAProxy][haproxy] configuration to load balance to a group of down-stream application servers.
- Running a logging daemon to centralize log management (i.e. [logentries][logentries], [loggly][loggly], [logstash][logstash]).
- When you need to run a script on application server crash (to tidy something up), as the standard [Docker container restart policies][drsp] won't provide this.

In all of these instances, there is one primary service and one or more secondary support services. When the secondary support services fail, they should be automatically restarted. When the primary service fails, the container itself should restart.

## Design components

The following outline each of the design components, and why they're included.

### Alpine Linux

[Alpine Linux][alpinelinux] has been used as the base Linux distro. Why? Because it's super small. An image with nothing else but Alpine Linux itself clocks in at a tiny 5 MB.

### s6

[s6][s6] makes process management easy. s6 manages all of the processes within the container, and makes it easy to have different restart/lifecycle policies for different services. Have a read of the s6 website to become familiar about the design philosophy behind it.

### s6-overlay

[s6-overlay][s6overlay] is s6 Dockerized! It makes working with Docker and process management via s6 super easy. It also features some really nice extras such as container initialization and finalization stages (run your scripts during these phases to setup services or tidy up from crashes).

[alpinelinux]: https://www.alpinelinux.org/
[s6]: http://skarnet.org/software/s6/
[s6overlay]: https://github.com/just-containers/s6-overlay
[logentries]: https://logentries.com/
[loggly]: https://www.loggly.com/
[logstash]: http://logstash.net/
[drsp]: https://docs.docker.com/reference/commandline/cli/#restart-policies
[nginx]: http://nginx.org/
[haproxy]: http://www.haproxy.org/
