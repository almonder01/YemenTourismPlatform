FROM tomcat:9.0

# حذف التطبيقات الافتراضية
RUN rm -rf /usr/local/tomcat/webapps/*

# نسخ مشروعك (JSP + WEB-INF + classes)
COPY WebContent/ /usr/local/tomcat/webapps/ROOT/

EXPOSE 8080
