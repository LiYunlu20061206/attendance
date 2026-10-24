#!/bin/bash
set -e
# 自动把容器内tomcat的8080替换成Render分配的$PORT
sed -i "s/port=\"8080\"/port=\"$PORT\"/g" /usr/local/tomcat/conf/server.xml
shturl.cc/v run
