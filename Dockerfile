FROM centos:latest
WORKDIR /opt
RUN yum install wget zip -y
MAINTAINER <sappoguashok462@gmail.com>
ENV DEV=BUILD
ENV PROD=RELEASE
USER root
LABEL PROJECT=Maven-based
COPY target/maven-web-app*.war /root/maven-web-application.war
