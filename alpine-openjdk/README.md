# alpine-openjdk

A Docker image for running [OpenJDK][openjdk], based on Alpine Linux.
This image belongs to a suite of images [documented here][dockeralpine].

## Features

This image features:

- [Alpine Linux][alpinelinux]
- [s6][s6] and [s6-overlay][s6overlay]
- [OpenJDK][openjdk]

## Versions

- `2.0.0`, `latest` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-openjdk-v2.0.0/alpine-openjdk/Dockerfile)
- `1.0.0` [(Dockerfile)](https://github.com/smebberson/docker-alpine/blob/alpine-openjdk-v1.0.0/alpine-openjdk/Dockerfile)

[See VERSIONS.md for image contents.](VERSIONS.md)  
[See OPENJDK.md to find specific OpenJDK versions.](OPENJDK.md)

## Usage

To use this image include `FROM smebberson/alpine-openjdk` at the top of your `Dockerfile`. Inheriting from `smebberson/alpine-openjdk` provides you with the OpenJDK, which can then used to launch your Java or Scala application or JAR file with [s6][s6]. You have two options for process management:

- s6 can keep it running for you, restarting it when it crashes.
- The entire container can exit allowing the host machine to kick in and restart it.

### Automatic restarts

To start your app, with automatic restarts:

- create a folder at `/etc/services.d/app` (or name it whatever you like, just make sure it lives within `/etc/services.d`)
- create a file in your new folder called `run` and give it execute permissions
- inside that file start start your node.js application, for example:

```
#!/usr/bin/with-contenv sh

# cd into our directory
cd /app

# start our java application
java -jar your.jar;
```

When you run this container, s6 will automatically start your application and make sure it stays running for you.

You'll also need to make sure you go through the usual process of adding your java source, installing your packages with `npm` and exposing the necessary ports for your application (usually within your Dockerfile).

### Container exits

To start your app in a fashion that will exit the container when your app dies, add something like the following to your Dockerfile:

```
CMD ["java", "-jar", "/app/your.jar"]
```

The container will execute the command and your Java app will start running. When it suddenly dies, your container will exit so you'll need processes on your host machine to restart it (i.e. `docker run --autorestart`).

#### Taking advantage of s6

The above method has the benefit of exiting the container when your Node.js app dies, but it doesn't really allow you to take advantage of s6. With s6, you can have processes that are executed after your app dies. For example, in case there is something you need to clean up before your host restarts the container. To take advantage of this, create the executable `run` file at `/etc/services.d/app` as described in **Automatic restarts**.

Now, create an executable file named `finish` at `/etc/services.d/app`. In this file do any clean up you need to, and then use s6 to kill the container, for example:

```
#!/usr/bin/with-contenv sh

# perform clean-up here

# use s6 to exit the container
s6-svscanctl -t /var/run/s6/services

```

You can simply remove the last line, if you want s6 to automatically restart your Java app again.

### Logging

If you're logging to stdout (which `System.out.println` does) then you'll be able to review your logs using the standard [Docker process][dockerlogs].

### Handling uncaught exceptions

The best way to handle exceptions is to:

1. Capture them.
1. Log them.
1. Exit the process and let s6 restart your app, or exit the container.

## Example

An example of using this image can be found in [examples/user-openjdk][example].

[dockeralpine]: https://github.com/smebberson/docker-alpine
[s6]: http://www.skarnet.org/software/s6/
[s6overlay]: https://github.com/just-containers/s6-overlay
[dockerlogs]: https://docs.docker.com/reference/commandline/cli/#logs
[alpinelinux]: https://www.alpinelinux.org/
[alpinebase]: https://registry.hub.docker.com/u/smebberson/alpine-base/
[example]: https://github.com/smebberson/docker-alpine/tree/master/examples/user-openjdk
[openjdk]: http://openjdk.java.net
