FROM tomcat:latest
MAINTAINER Maksim Danilchenko <ms.danilchenko@gmail.com>

ARG BUILD_FOLDER=task3
ARG BUILD_VERSION=1.0.0003

RUN mkdir /usr/local/tomcat/webapps/$BUILD_FOLDER

WORKDIR /usr/local/tomcat/webapps/$BUILD_FOLDER

RUN curl -o $BUILD_FOLDER.war 'http://72.22.0.4:8081/nexus/service/local/repositories/snapshots/content/$BUILD_FOLDER/$BUILD_VERSION/$BUILD_FOLDER.war'

EXPOSE 8080

CMD ["catalina.sh", "run"]
