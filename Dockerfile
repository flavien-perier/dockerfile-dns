FROM alpine

LABEL org.opencontainers.image.title="DNS" \
      org.opencontainers.image.description="Bind DNS" \
      org.opencontainers.image.version="2.0.1" \
      org.opencontainers.image.vendor="flavien.io" \
      org.opencontainers.image.maintainer="Flavien PERIER <perier@flavien.io>" \
      org.opencontainers.image.url="https://github.com/flavien-perier/dockerfile-dns" \
      org.opencontainers.image.source="https://github.com/flavien-perier/dockerfile-dns" \
      org.opencontainers.image.licenses="MIT"

ENV SERVER_DOMAIN="127.0.0.1" \
    BASE_PATH="lan" \
    SUB_DOMAINS="www cloud mail" \
    SUB_DNS="208.67.222.222 208.67.220.220"

RUN apk --update --no-cache add bind

EXPOSE 53

COPY --chown=root:root --chmod=500 start.sh /root/start.sh
COPY --chown=root:root --chmod=400 db.local /root/db.local
COPY --chown=root:root --chmod=400 named.conf /root/named.conf

CMD /root/start.sh
