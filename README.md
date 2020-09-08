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
