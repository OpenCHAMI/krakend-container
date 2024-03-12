FROM devopsfaith/krakend
RUN apk add openssl step-cli socat curl jq
RUN curl https://get.acme.sh | sh
COPY --chmod=555 --chown=krakend:krakend init.sh /bin/init.sh
COPY --chmod=555 --chown=krakend:krakend init.sh /bin/update_loop.sh
EXPOSE 8080/TCP
EXPOSE 80/TCP
ENTRYPOINT init.sh

