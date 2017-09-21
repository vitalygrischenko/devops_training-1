FROM tomcat:latest
MAINTAINER Maksim Danilchenko <ms.danilchenko@gmail.com>

ARG BUILD_FOLDER=task3

ADD ./$BUILD_FOLDER.war /usr/local/tomcat/webapps

EXPOSE 8080


CMD ["catalina.sh", "run"]
