FROM alpine

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh && apk add --no-cache curl

ENTRYPOINT "/entrypoint.sh"
