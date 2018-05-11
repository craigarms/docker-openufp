FROM alpine:latest

COPY entrypoint.sh /

RUN apk update \
 && apk --no-cache add git g++ make db db-dev \
 && git clone https://github.com/craigarms/openufp.git \
 && cd openufp \
 && make \
 && make install \
 && apk del git g++ make db-dev \
 && rm -rf /var/cache/apk/* \
 && mkdir /blacklist \
 && chmod +x /entrypoint.sh

EXPOSE 4005/tcp

VOLUME ["/blacklist"]

ENTRYPOINT ["/entrypoint.sh"]
