![license](https://badgen.net/github/license/flavien-perier/dockerfile-dns)
[![docker pulls](https://badgen.net/docker/pulls/flavienperier/dns)](https://hub.docker.com/r/flavienperier/dns)
[![ci status](https://badgen.net/github/checks/flavien-perier/dockerfile-dns)](https://github.com/flavien-perier/dockerfile-dns)

# Dockerfile DNS

Dockerfile for [Bind](https://www.isc.org/bind/) DNS.

## Env variables

- SERVER_DOMAIN: In your configuration files the annotation `@SERVER_IP` will be replaced by the IP of the domain specified in this variable.

## Ports

- 53: UDP

## Volumes

- /bind: Bind9 configuration files

## Docker-compose example

```yaml
dns:
  image: flavienperier/dns
  container_name: dns
  restart: always
  volumes:
    - bindConf:/bind
  ports:
    - 53:53/udp
  environment:
    SERVER_DOMAIN: www.my-cname.com
```
