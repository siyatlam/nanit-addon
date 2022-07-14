ARG NANIT_BASE_VERSION=latest

FROM registry.gitlab.com/adam.stanek/nanit:$NANIT_BASE_VERSION AS nanit-base

FROM debian:buster
#for some reason the curl using apt-get does not work correctly - using wget to get curl, then copy a curl binary
RUN apt-get update && apt-get install -y \
  ca-certificates \
  ffmpeg \
  jq \
  curl

#RUN wget https://github.com/moparisthebest/static-curl/releases/download/v7.83.1/curl-armv7 -O /usr/bin/curl
#RUN chmod a+x /usr/bin/curl

RUN mkdir -p /usr/src/bashio \
     && curl -L -f -s "https://github.com/hassio-addons/bashio/archive/v0.14.3.tar.gz" \
         | tar -xzf - --strip 1 -C /usr/src/bashio \
     && mv /usr/src/bashio/lib /usr/lib/bashio \
     && ln -s /usr/lib/bashio/bashio /usr/bin/bashio 

RUN mkdir -p /app/data
COPY nanit.sh /app/bin/nanit.sh
RUN chmod a+x /app/bin/nanit.sh
COPY --from=nanit-base /app/bin/nanit /app/bin/nanit
WORKDIR /app

ENV NANIT_MQTT_ENABLED=true

CMD ["/app/bin/nanit.sh"]