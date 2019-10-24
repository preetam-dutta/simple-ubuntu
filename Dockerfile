FROM ubuntu:18.04

RUN addgroup --system --gid 500 appgroup \
  && adduser --system --home /home/appuser --uid 500 --gid 500 appuser \
  && apt-get update \
  && apt-get install dnsutils -y \
  && apt-get install openjdk-11-jdk -y \
  && apt-get install curl -y \
  && apt-get install jq -y

WORKDIR /usr/local/bin/
COPY ./kumbhkaran.sh /usr/local/bin/
RUN chmod 755 kumbhkaran.sh

USER appuser:appgroup
WORKDIR /home/appuser
ENTRYPOINT kumbhkaran.sh