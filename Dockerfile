FROM tomcat:8.0-alpine
COPY /var/lib/jenkins/workspace/capstoneProject/target/maven-web-application.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD [“catalina.sh”, “run”]
