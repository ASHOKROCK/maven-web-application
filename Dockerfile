FROM centos:latest
WORKDIR /opt
RUN  yum install wget  git zip -y
MAINTAINER <sappoguashok462@gmail.com>
ENV DEV=BUILD
COPY . .
ENV PROD=RELEASE
USER root
LABEL PROJECT=Maven-based


