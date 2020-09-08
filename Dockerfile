FROM alpine

LABEL maintainer="Flavien PERIER <perier@flavien.io>"
LABEL version="1.0"
LABEL description="Bind DNS"

RUN apk --update --no-cache add bind

ENV SERVER_DOMAIN=127.0.0.1

COPY start.sh /root/start.sh

VOLUME /bind
EXPOSE 53

CMD /root/start.sh
