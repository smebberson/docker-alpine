# docker-alpine Consul Example

This is an example of using Docker containers to orchestrate microservices using [Consul][consul], backed by [s6][s6].

## Why Docker?

Using Docker makes your infrastructure and environment consistent, testable, scalable and repeatable.

### What are microservices?

Docker promotes the concept of microservices. Microservices are isolated services doing one thing, and doing it well. For example each of the following would be contained within one Docker container:

- Web application code running in Node.js.
- Redis serving as the session data store for the Node.js web application.
- MongoDB serving as the database for the Node.js web application.
- Nginx web server proxying requests to Node.js.

### How do they talk to each other?

That's called service discovery. We solve that problem using Consul (which is a distributed service discovery tool, with built-in health checks). Each of the containers above advertise the service they're running via Consul. To achieve this, there is a Consul cluster and then each service runs a Consul agent. Consul _talks_ to enable service discovery via HTTP, and DNS.

This allows the Nginx container to query Consul for the IP address of the Node.js container such that it can proxy a request through to the Node.js container.

### What about scalability?

Setting up your infrastructure using microservices makes scalability a breeze.

An example: load balancing the Node.js web application using Nginx. To do so, start two Node.js containers. Then, when the Nginx container queries Consul for the IP address of the Node.js container it will actually receive two IP addresses. It can then round robin (or any other [type of load balancing method][nginxloadbalancing]) requests to the two different Node.js services.

### Okay, so what is s6?

s6 is a process manager. It makes it super simple to start multiple processes within the one container and manage them correctly.

**Aren't you only supposed to run one process per container?**

Not exactly. These Docker images are a perfect example. Take the Redis image above as an example, it needs to run Redis (obviously) but also Consul (in agent mode) such that it can advertise the Redis service as up and ready for connections.

s6 can be used to restart processes as they die, or bring the entire container to have your orchestration tool restart it (i.e. Docker Compose, Kubernetes or Nomad).

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

## Usage

To run this example:

- Change into this directory `cd /vagrant/examples/complete`.
- Start the containers using Docker Compose `dc up -d && dc logs`. This will start the containers in background mode, but will show the logs so you can see what is happening.

You can view http://192.168.89.10:8500/ui/ to see the Consul UI showing everything setup and communicating.

### Testing

There are two workflows to test (as far as the containers running Consul in server mode are concerned):

- Services crashing.
- Hitting `CTRL+C` while in development mode.

To test services crashing:

- Gain access to a container (via `docker exec -it complete_consul2_1 with-contenv sh`), find the pid of Consul (via `ps aux`), and then kill it (via `kill -9 <pid>`). This will kill the Consul process without a signal, simulating a crash.

Using this method (if the container is one with Consul running in server mode), the container should completely exit (in this instance other containers running Consul in server mode will attempt to rejoin the exited container which is normal). If the container is one with Consul running in agent mode (i.e. static), Consul should be restarted and immediately rejoin the cluster.

To test stopping services:

- Issue `dc stop consul2 && dc rm --force consul2`.

Using this method the container should completely exit, with a proper leave from the Consul cluster (check for a deregistered event in the logs of another container running Consul in server mode).

[s6]: http://www.skarnet.org/software/s6/
[consul]: https://www.consul.io/
[nginxloadbalancing]: http://nginx.org/en/docs/http/load_balancing.html
