FROM tomcat
ADD target/maven-web-application.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
