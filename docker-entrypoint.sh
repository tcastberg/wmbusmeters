#!/bin/sh -x

if [ ${OUTPUT} == "json" ]; then WMOUTPUT=--robot=json;
elif [ ${OUTPUT} == "mqtt" ]; then WMOUTPUT=--shell="mosquitto_pub -h ${MQTT_HOSTNAME:-localhost} -p ${MQTT_HOSTPORT:-1883} -t ${MQTT_TOPIC:-meter} -m '$METER_JSON'"; fi
if [ -z "${METERTYPE}" ]; then echo "METERTYPE not defined"; fi
if [ -z "${METERID}" ]; then echo "METERID not defined"; fi
if [ -z "${METERKEY}" ]; then echo "METERKEY not defined"; fi
export MQTT_HOSTNAME
export MQTT_HOSTPORT
export MQTT_TOPIC

exec /wmbusmeters/wmbusmeters ${VERBOSE} ${WMOUTPUT} ${DEVICE:-auto} ${NAME:-MyMeter} ${METERTYPE} ${METERID} ${METERKEY}
