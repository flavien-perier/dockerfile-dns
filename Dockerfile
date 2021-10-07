FROM alpine

LABEL maintainer="Flavien PERIER <perier@flavien.io>" \
      version="2.0.1" \
      description="Bind DNS"

ENV SERVER_DOMAIN="127.0.0.1" \
    BASE_PATH="lan" \
    SUB_DOMAINS="www cloud mail" \
    SUB_DNS="208.67.222.222 208.67.220.220"

COPY --chown=root:root . /root/

RUN apk --update --no-cache add bind && \
    chmod 750 /root/start.sh

EXPOSE 53

CMD /root/start.sh
