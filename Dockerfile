# Use the official Tomcat 9 image with Java 11
FROM tomcat:9.0-jdk11-corretto

# Remove the default Tomcat welcome applications (optional)
RUN rm -rf /usr/local/tomcat/webapps/ROOT \
           /usr/local/tomcat/webapps/docs \
           /usr/local/tomcat/webapps/examples \
           /usr/local/tomcat/webapps/host-manager \
           /usr/local/tomcat/webapps/manager

# Copy the war file into Tomcat's webapps folder
COPY attendance.war /usr/local/tomcat/webapps/attendance.war

# 复制启动脚本（名字你继续用 entrypoint.sh 也行，不用改名）
COPY entrypoint.sh /usr/local/tomcat/bin/entrypoint.sh
RUN chmod +x /usr/local/tomcat/bin/entrypoint.sh

# EXPOSE 只是文档标注，Render不认这个，保留也没事
EXPOSE 8080
CMD ["/usr/local/tomcat/bin/entrypoint.sh"]
