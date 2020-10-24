FROM alpine

LABEL maintainer="Flavien PERIER <perier@flavien.io>"
LABEL version="1.0"
LABEL description="Bind DNS"

ENV SERVER_DOMAIN="127.0.0.1"
ENV BASE_PATH="lan"
ENV SUB_DOMAINS="www cloud mail"
ENV SUB_DNS="208.67.222.222 208.67.220.220"

COPY db.local /root/db.local
COPY named.conf /root/named.conf
COPY start.sh /root/start.sh

RUN apk --update --no-cache add bind && \
    chown root:root /root/start.sh && \
    chmod 750 /root/start.sh

EXPOSE 53

CMD /root/start.sh
