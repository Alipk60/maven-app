FROM tomcat:8.0-alpine
ADD /var/lib/jenkins/workspace/capstoneProject/target/maven-web-application.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD [“catalina.sh”, “run”]
