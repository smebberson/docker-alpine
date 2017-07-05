# alpine-consul-ui

This file contains all software versions, that correspond to a version of this image itself. Read more about the [alpine-consul-ui image here][alpineconsului].

## Latest

Same as v2.2.0.

Usage: `smebberson/alpine-consul-ui` or `smebberson/alpine-consul-ui:latest`.

## v2.2.0

- [smebberson/alpine-consul: v3.2.0][alpineconsul320]

Improvements:

- Everything from the `v2.2.0` beta rounds.

Usage: `smebberson/alpine-consul-base:2.2.0`.

## v2.2.0-beta.2

- [smebberson/alpine-consul: v3.2.0-beta.2][smebbersonalpineconsul320beta2]
- [Consul v0.8.5][consului]

Improvements:

- Upgraded to `alpine-consul:3.2.0-beta.2`. which has a slew of updates.
- Changes to the Consul run script inline with `alpine-consul` `v3.2.0-beta.2`.

Usage: `smebberson/alpine-consul-ui:2.2.0-beta.2`.

## v2.2.0-beta.1

- [smebberson/alpine-consul: v3.2.0-beta.1][smebbersonalpineconsul320beta1]
- [Consul v0.8.4][consului]

Improvements:

- Upgraded to `alpine-consul:3.2.0-beta.1` which has a slew of updates. [Read more here][smebbersonalpineconsul320beta1].
- Changes to the Consul run script inline with `alpine-consul` `v3.2.0-beta.1`.

Usage: `smebberson/alpine-consul-ui:2.2.0-beta.1`.

## v2.1.0

- [smebberson/alpine-consul: v3.1.0][smebbersonalpineconsul310]
- [Consul v0.7.0][consului]

Improvements:

- Upgraded to `alpine-consul:3.1.0` which has a slew of updates. [Read more here][smebbersonalpineconsul310].

Usage: `smebberson/alpine-consul-ui:2.1.0`.

## v2.0.0

- [smebberson/alpine-consul: v3.0.0][smebbersonalpineconsul300]
- [Consul v0.6.4][consului]

__*Breaking changes*__:

- This release updates to [alpine-base v3.0.0 which contains breaking changes](https://github.com/smebberson/docker-alpine/blob/master/alpine-base/VERSIONS.md#v300). You should review them as required.
- Assumes joining a zero-conf bootstrapped Consul cluster which requires Docker 1.10+. You should [review the usage guide](https://github.com/smebberson/docker-alpine/tree/master/alpine-consul#usage) for more information.

Usage: `smebberson/alpine-consul-ui:2.0.0`.

## v1.0.0

- [smebberson/alpine-consul: v1.0.0][smebbersonalpineconsul100]
- [Consul UI v5.2.0][consului]

Usage: `smebberson/alpine-consul-ui:1.0.0`.

[consului]: https://demo.consul.io/ui/
[alpineconsului]: https://github.com/smebberson/docker-alpine/tree/master/alpine-consul-ui
[smebbersonalpineconsul320]: https://github.com/smebberson/docker-alpine/tree/alpine-consul-v3.2.0/alpine-consul
[smebbersonalpineconsul320beta2]: https://github.com/smebberson/docker-alpine/tree/alpine-consul-v3.2.0-beta.2/alpine-consul
[smebbersonalpineconsul320beta1]: https://github.com/smebberson/docker-alpine/tree/alpine-consul-v3.2.0-beta.1/alpine-consul
[smebbersonalpineconsul310]: https://github.com/smebberson/docker-alpine/tree/alpine-consul-v3.1.0/alpine-consul
[smebbersonalpineconsul300]: https://github.com/smebberson/docker-alpine/tree/alpine-consul-v3.0.0/alpine-consul
[smebbersonalpineconsul100]: https://github.com/smebberson/docker-alpine/tree/alpine-consul-v1.0.0/alpine-consul
