ARG NANIT_BASE_VERSION=latest

FROM registry.gitlab.com/adam.stanek/nanit:$NANIT_BASE_VERSION AS nanit-base

FROM debian:buster
RUN apt-get -yqq update \
    && apt-get install -yq --no-install-recommends ca-certificates ffmpeg jq wget

RUN mkdir -p /usr/src/bashio \
    && wget "https://github.com/hassio-addons/bashio/archive/v0.14.3.tar.gz" -O wget.tar.gz

RUN tar -xzf wget.tar.gz --strip 1 -C /usr/src/bashio \
    && mv /usr/src/bashio/lib /usr/lib/bashio \
    && ln -s /usr/lib/bashio/bashio /usr/bin/bashio 

RUN mkdir -p /app/data
COPY nanit.sh /app/bin/nanit.sh
RUN chmod a+x /app/bin/nanit.sh
COPY --from=nanit-base /app/bin/nanit /app/bin/nanit
WORKDIR /app

ENV NANIT_MQTT_ENABLED=true

CMD ["/app/bin/nanit.sh"]