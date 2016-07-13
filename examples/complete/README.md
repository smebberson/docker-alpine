# docker-alpine Consul Example

This is an example of using Docker containers to orchestrate microservices using [Consul][consul], backed by [s6][s6].

## Usage

To run this example:

- Change into this directory `cd /vagrant/examples/complete`.
- Start the containers using Docker Compose `dc up -d && dc scale consul=3 app=3 && dc logs`. This will start the containers in background mode, but will show the logs so you can see what is happening.

You can view http://192.168.89.10:8500/ui/ to see the Consul UI showing everything setup and communicating.
You can view http://192.168.89.10/ to see the requests being served to and responded by different Node.js containers, maintaining stick sessions.

### Testing

There are two workflows to test (as far as the containers running Consul in server mode are concerned):

- Services crashing.
- Hitting `CTRL+C` while in development mode.

To test services crashing:

- Gain access to a container (via `docker exec -it complete_consul_1 with-contenv sh`), find the pid of Consul (via `ps aux`), and then kill it (via `kill -9 <pid>`). This will kill the Consul process without a signal, simulating a crash.

Using this method (if the container is one with Consul running in server mode), the container should completely exit (in this instance other containers running Consul in server mode will attempt to rejoin the exited container which is normal). If the container is one with Consul running in agent mode (i.e. static), Consul should be restarted and immediately rejoin the cluster.

To test stopping services:

- Issue `docker stop complete_consul_1 && docker rm --force complete_consul_1`.

Using this method the container should completely exit, with a proper leave from the Consul cluster (check for a deregistered event in the logs of another container running Consul in server mode).

## Crashes and restarts.

The Consul-based images in this repository have been designed to meet the following requirements:

Containers running Consul in server mode:

- When Consul dies: kill the container immediately.
- When Consul starts: remove all data associated with Consul so everything starts afresh.

Containers running Consul in agent mode:

- When Consul dies: immediately restart it using s6.
- When Consul starts: it will use the Consul data previously create to quickly rejoin a cluster.
- When the primary service dies: kill the container immediately.

We've found this to be the most consistent way to effectively run Consul in production. This also supports the development workflow in which you `CTRL+C` to stop a container from running.

## Consul bootstrapping

This updated example uses zero-conf Consul bootstrapping. To achieve this, `docker-engine` v1.10+ is required. Docker's new built-in DNS server is used within each container to find the IP of a consul container (**note**: there is a requirement that the service in `docker-compose.yml` is called `consul` for this to work).

I think this is an improvement on the previous method in which one primary Consul server needed to be started, and other then joined one the IP was known.

At the moment, the files necessary to achieve this are found within the containers local to this example only. This will change, but while I was iterating this was easier.

[s6]: http://www.skarnet.org/software/s6/
[consul]: https://www.consul.io/
[nginxloadbalancing]: http://nginx.org/en/docs/http/load_balancing.html
