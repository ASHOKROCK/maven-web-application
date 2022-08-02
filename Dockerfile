FROM openjdk:8-jre-alpine
COPY .  .
USER root
LABEL foo=bar
