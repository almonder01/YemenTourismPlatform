FROM tomcat:9.0

# حذف التطبيقات الافتراضية
RUN rm -rf /usr/local/tomcat/webapps/*

# نسخ webapp إلى Tomcat ROOT
COPY src/main/webapp/ /usr/local/tomcat/webapps/ROOT/

EXPOSE 8080
