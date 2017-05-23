#!/bin/sh

openssl req \
    -new \
    -newkey rsa:2048 \
    -days 365 \
    -nodes \
    -x509 \
    -subj "/C=US/ST=California/L=San Francisco/O=WebShare/CN=localhost" \
    -keyout key.pem \
    -out cert.pem

exec socat -v openssl-listen:$1,cert=cert.pem,key=key.pem,verify=0,reuseaddr,fork tcp4:$2:$3

