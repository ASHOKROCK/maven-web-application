FROM centos:latest

USER root

LABEL foo=bar

ENV mydev=javaproject

RUN  sudo yum install java-11-openjdk -y && yum install maven -y

RUN mkdir /usr/local/app

COPY  target/maven-web-application.war /usr/local/app

WORKDIR /usr/local/app
COPY . .
CMD ["java","-jar","maven-web-application.war"]
