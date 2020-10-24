![license](https://badgen.net/github/license/flavien-perier/dockerfile-dns)
[![docker pulls](https://badgen.net/docker/pulls/flavienperier/dns)](https://hub.docker.com/r/flavienperier/dns)
[![ci status](https://badgen.net/github/checks/flavien-perier/dockerfile-dns)](https://github.com/flavien-perier/dockerfile-dns)

# Dockerfile DNS

Dockerfile for [Bind](https://www.isc.org/bind/) DNS.

## Env variables

- SERVER_DOMAIN: IP or domain to resolve.
- BASE_PATH: Basic path (example: domain.lan).
- SUB_DOMAINS: List of sub-domains (for example: www mail cloud).
- SUB_DNS: List of sub DNS. By default the service uses OpenDNS.

## Ports

- 53: UDP

## Docker-compose example

```yaml
dns:
  image: flavienperier/dns
  container_name: dns
  restart: always
  ports:
    - 53:53/udp
  environment:
    SERVER_DOMAIN: www.my-cname.com
```
