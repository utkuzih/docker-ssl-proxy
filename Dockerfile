FROM alpine

RUN apk add --no-cache socat openssl
ADD docker-entrypoint.sh /

VOLUME "/certs"
WORKDIR "/certs"

ENTRYPOINT ["/docker-entrypoint.sh"]
