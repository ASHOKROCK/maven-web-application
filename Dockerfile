FROM centos:7

USER root

LABEL foo=bar

ENV mydev=javaproject

RUN  yum update -y

RUN   yum  install java-11-openjdk -y &&   yum install maven -y

COPY . .

RUN mvn clean package

#RUN mkdir /usr/local/app

#COPY  /target/maven-web-application.war  .

COPY . .

CMD [ "java","-jar","maven-web-application.war" ]
