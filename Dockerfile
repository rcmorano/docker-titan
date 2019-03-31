FROM alpine

ARG BUILD_TIMESTAMP=201903312245
ENV TITAN_DB /data/titan.db
VOLUME ["/data"]

RUN apk --no-cache add git make g++ sqlite-dev openssl-dev

RUN git clone https://github.com/nrosvall/titan.git && \
    cd titan && \
    make  && \
    ln -s $PWD/titan /usr/local/bin/titan

ADD ./assets /assets
ENTRYPOINT ["/assets/bin/entrypoint"]
