# alpine-consul-nodejs

A Docker image for running [Node.js][nodejs] with [Consul][consul], based on Alpine Linux.
This image belongs to a suite of images [documented here][dockeralpine].

Image size is ~144.4 MB.

## Features

This image features:

- [Alpine Linux][alpinelinux]
- [s6][s6] and [s6-overlay][s6overlay]
- [Node.js][nodejs]
- [consul][consul]

## Versions

- `5.2.2`, `latest` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-consul-nodejs-v5.2.2/alpine-consul-nodejs/Dockerfile)
- `5.2.1` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-consul-nodejs-v5.2.1/alpine-consul-nodejs/Dockerfile)
- `5.2.0` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-consul-nodejs-v5.2.0/alpine-consul-nodejs/Dockerfile)
- `5.1.0` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-consul-nodejs-v5.1.0/alpine-consul-nodejs/Dockerfile)
- `5.0.0` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-consul-nodejs-v5.0.0/alpine-consul-nodejs/Dockerfile)
- `4.0.0` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-consul-nodejs-v4.0.0/alpine-consul-nodejs/Dockerfile)
- `3.0.0` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-consul-nodejs-v3.0.0/alpine-consul-nodejs/Dockerfile)
- `2.0.0` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-consul-nodejs-v2.0.0/alpine-consul-nodejs/Dockerfile)
- `1.0.0` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-consul-nodejs-v1.0.0/alpine-consul-nodejs/Dockerfile)

[See VERSIONS.md for image contents.](https://github.com/smebberson/docker-alpine/blob/master/alpine-consul-nodejs/VERSIONS.md)
[Looking for a particular version of Node.js? See NODEJS.md for more information.](https://github.com/smebberson/docker-alpine/blob/master/alpine-consul-nodejs/VERSIONS.md)

## Usage

To use this image include `FROM smebberson/alpine-consul-nodejs` at the top of your `Dockerfile`. Inheriting from `smebberson/alpine-consul-nodejs` provides you with the ability to easily start your Node.js application using [s6][s6].

This container has been setup to automatically connect to a Consul cluster, created with a service name of `consul`. [Read more about it here](https://github.com/smebberson/docker-alpine/tree/master//alpine-consul).

You have two options for process management:

- s6 can keep it running for you, restarting it when it crashes.
- The entire container can exit allowing the host machine to kick in and restart it.

To start your app, with automatic restarts:

- create a folder at `/etc/services.d/app` (or name it whatever you like, just make sure it lives within `/etc/services.d`)
- create a file in your new folder called `run` and give it execute permissions
- inside that file start start your node.js application, for example:

```
#!/usr/bin/env sh

# cd into our directory
cd /app

# start our node.js application
node server.js;
```

When you run this container, s6 will automatically restart your application and make sure it stays running for you.

You'll also need to make sure you go through the usual process of adding your Node.js source, installing your packages with `npm` and exposing the necessary ports for your application (usually within your Dockerfile).

### Service registration with Consul

If you're using this image, chances are, you want to register this Node.js application as a service with Consul, so that other containers can discover this service and use it as required (i.e. an Nginx container that will configure itself as a proxy for your Node.js app).

To do, create a file at `/etc/consul/conf.d/app.json` (or call it whatever you want, as long as you create a `.json` file within `/etc/consul/conf.d/`) and add it to your image:

```
{
    "service": {
        "name": "app",
        "tags": ["app","nodejs"],
        "port": 4000,
        "check": {
            "id": "app",
            "name": "Node.js app on port 4000"
            "http": "http://localhost/ping",
            "interval": "10s",
            "timeout": "1s"
        }
    }
}

```

This file registers your Node.js app with Consul, giving it a service name of `app`. It also defines a health check that will respond to a `GET / HTTP/1.1 Host: localhost:4000` request. Consul will use this health check to broadcast the status of your Node.js application.

### Configuration generation with consul-template

This container also features consul-template which allows you to easily generate configuration files based on Consul services. You can [read more about this feature here](https://github.com/smebberson/docker-alpine/tree/master/alpine-consul-base#customisation).

### Container exits

To start your app in a fashion that will exit the container when your app dies, add something like the following to your Dockerfile:

```
CMD ["node", "/app/server.js"]
```

The container will execute the command and your Node app will start running. When it suddenly dies, your container will exit so you'll need processes on your host machine to restart it (i.e. `docker run --autorestart`).

#### Taking advantage of s6

The above method has the benefit of exiting the container when your Node.js app dies, but it doesn't really allow you to take advantage of s6. With s6, you can have processes that are executed after your app dies. For example, in case there is something you need to clean up before your host restarts the container. To take advantage of this, create the executable `run` file at `/etc/services.d/app` as described in **Automatic restarts**.

Now, create an executable file named `finish` at `/etc/services.d/app`. In this file do any clean up you need to, and then use s6 to kill the container, for example:

```
#!/usr/bin/env sh

# perform clean-up here

# use s6 to exit the container
s6-svscanctl -t /var/run/s6/services

```

You can simply remove the last line, if you want s6 to automatically restart your Node.js app again.

### Logging

If you're logging to stdout (which `console.log` does) then you'll be able to review your logs using the standard [Docker process][dockerlogs].

### Handling uncaught exceptions

The best way to handle exceptions is to:

1. Capture them.
1. Log them.
1. Exit the process and let s6 restart your app, or exit the container.

This will ensure that your errors aren't going un-noticed, but that your application stays up and in proper functioning order. An example of this is (although, I recommend a better logging solution):

```
process.on('uncaughtException', function (e) {

    console.log(e);
    process.exit(1);

});
```

## Example

An example of using this image can be found in [examples/user-consul-nodejs][example].

[dockeralpine]: https://github.com/smebberson/docker-alpine
[s6]: http://www.skarnet.org/software/s6/
[s6overlay]: https://github.com/just-containers/s6-overlay
[alpinelinux]: https://www.alpinelinux.org/
[consul]: https://consul.io/
[nodejs]: https://nodejs.org/
[dockerlogs]: https://docs.docker.com/reference/commandline/cli/#logs
[example]: https://github.com/smebberson/docker-alpine/tree/master/examples/user-consul-nodejs
