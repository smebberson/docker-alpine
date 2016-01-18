alpine-nodejs
=============

An image for using Node.js within containers, bundled with [Alpine Linux][alpinelinux] and [s6][s6].

[It's built from my Alpine Linux based Docker image (with s6, and DNS `search` support)][alpinebase].

Versions
--------

- `3.0.1`, `latest` [(Dockerfile)](https://github.com/smebberson/docker-alpine/tree/master/alpine-nodejs/Dockerfile)
- `3.0.0` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/0897f9e089a338ca92643daf76e3c6d8e2ac5dd1/alpine-nodejs/Dockerfile)
- `2.0.0` [(Dockerfile)](https://github.com/smebberson/docker-alpine/tree/9202662d6628b64ab456b3ec11a35721f5459a22/alpine-nodejs)
- `1.0.0` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/cd0d6cdaf2be905e21acf1b99d19d1fbe3c1f0fb/alpine-nodejs/Dockerfile)

[See VERSIONS.md for image contents.](https://github.com/smebberson/docker-alpine/blob/master/alpine-nodejs/VERSIONS.md)

Usage
-----

To use this image include `FROM smebberson/alpine-nodejs` at the top of your `Dockerfile`. Inheriting from `smebberson/alpine-nodejs` provides you with the ability to easily start your node.js application using [s6][s6]. You have two options for process management:

- s6 can keep it running for you, restarting it when it crashes.
- The entire container can exit allowing the host machine to kick in and restart it.

### Automatic restarts

To start your app, with automatic restarts:

- create a folder at `/etc/services.d/app` (or name it whatever you like, just make sure it lives within `/etc/services.d`)
- create a file in your new folder called `run` and give it execute permissions
- inside that file start start your node.js application, for example:

```
#!/usr/bin/env sh

# cd into our directory
cd /app

# start our node.js application
exec node server.js;
```

When you run this container, s6 will automatically start your application and make sure it stays running for you.

You'll also need to make sure you go through the usual process of adding your node.js source, installing your packages with `npm` and exposing the necessary ports for your application (usually within your Dockerfile).

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

[s6]: http://www.skarnet.org/software/s6/
[dockerlogs]: https://docs.docker.com/reference/commandline/cli/#logs
[alpinelinux]: https://www.alpinelinux.org/
[alpinebase]: (https://registry.hub.docker.com/u/smebberson/alpine-base/)
