

FROM tomcat:9.0-jdk17

RUN rm -rf /usr/local/tomcat/webapps/ROOT



COPY dist/Cookies.war /usr/local/tomcat/webapps/ROOT.war


EXPOSE 8080

# Khởi động Tomcat
CMD ["catalina.sh", "run"]

