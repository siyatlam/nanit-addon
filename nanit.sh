#!/usr/bin/bashio

export NANIT_EMAIL=$(bashio::config 'email')
export NANIT_PASSWORD=$(bashio::config 'password')
export NANIT_RTMP_ADDR=$(bashio::config 'address')
export NANIT_MQTT_BROKER_URL=$(bashio::config 'mqttbroker')
export NANIT_MQTT_USERNAME=$(bashio::config 'mqttuser')
export NANIT_MQTT_PASSWORD=$(bashio::config 'mqttpassword')

export NANIT_MQTT_ENABLED=true

bashio::log.info "Starting Nanit Add-On ..."

exec /app/bin/nanit