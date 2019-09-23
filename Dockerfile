FROM golang:alpine3.9
MAINTAINER Antoine Grondin <antoinegrondin@gmail.com>

RUN apk update && \
    apk upgrade && \
    apk add bash git gcc libc-dev && \
    rm -rf /var/cache/apk/*

RUN go get -u github.com/pressly/goose/cmd/goose

ENTRYPOINT [ "goose" ]