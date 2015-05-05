alpine-consul-nodejs
====================

An image for using Node.js within containers, bundled with [Alpine Linux][alpinelinux] and [s6][s6] and [Consul][consul].

This image is perfect if you're looking to run nginx to proxy to a Node.js application, or if you're wanting to run nginx as a load balancer (proxying to external containers) and using Node.js for nginx configuration.

Usage
-----

This is really just a combination of the [smebberson/alpine-consul-nginx][alpineconsulnginx] and [smebberson/alpine-consul-nodejs][alpineconsulnodejs] containers. Read their individual documentation for more information.

There is [an example however, showing how to combine the two][demo] to have nginx serve a dynamic Node.js website.

[s6]: http://www.skarnet.org/software/s6/
[alpinelinux]: https://www.alpinelinux.org/
[consul]: https://consul.io/
[alpineconsulnginx]: https://github.com/smebberson/docker-alpine/tree/master/alpine-consul-nginx
[alpineconsulnodejs]: https://github.com/smebberson/docker-alpine/tree/master/alpine-consul-nodejs
[demo]: https://github.com/smebberson/docker-alpine/tree/master/examples/alpine-consul-nginx-nodejs
