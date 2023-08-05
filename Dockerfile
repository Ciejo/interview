FROM alpine:3.7

RUN apk update && \
    apk upgrade && \
    apk --no-cache add curl jq file

WORKDIR /tendermint
EXPOSE 26656 26657

STOPSIGNAL SIGTERM

COPY tendermint /usr/bin/tendermint
COPY wrapper.sh /usr/bin/wrapper.sh
COPY config-template.toml /etc/tendermint/config-template.toml

ENTRYPOINT ["/usr/bin/wrapper.sh"]
CMD ["node", "--proxy_app", "kvstore"]