FROM alpine

LABEL maintainer="Flavien PERIER <perier@flavien.io>"
LABEL version="1.0"
LABEL description="Bind DNS"

ENV SERVER_DOMAIN=127.0.0.1

COPY start.sh /root/start.sh

RUN apk --update --no-cache add bind && \
    chown root:root /root/start.sh && \
    chmod 750 /root/start.sh

VOLUME /bind
EXPOSE 53

CMD /root/start.sh
