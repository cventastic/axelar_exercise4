FROM golang:1.16-alpine as builder

RUN apk add --no-cache make gcc musl-dev linux-headers git bash

RUN git clone https://github.com/cosmos/gaia.git
RUN cd gaia && git checkout v5.0.5 && make install

FROM alpine:latest

RUN apk add --no-cache ca-certificates curl jq tini
COPY --from=builder /go/bin/gaiad /usr/local/bin/
COPY docker-entrypoint.sh /root/entrypoint.sh
RUN ["chmod", "+x", "/root/entrypoint.sh"]

EXPOSE 26656
ENTRYPOINT ["/root/entrypoint.sh"]
