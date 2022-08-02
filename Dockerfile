FROM maven:3.6.3-openjdk
WORKDIR /opt
COPY . .
MAINTAINER <sappoguashok462@gmail.com>
ENV DEV=BUILD
RUN mvn clean package
ENV PROD=RELEASE
USER root
LABEL PROJECT=Maven-based


