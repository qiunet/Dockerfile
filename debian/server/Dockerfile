FROM qiunet/debian:java
MAINTAINER qiunet qiunet@gmail.com

COPY apache-tomcat-8.5.6.tar.gz /root/
COPY docker-run.sh /

RUN cd /root/ && tar xzf apache-tomcat-8.5.6.tar.gz && rm *.tar.gz && chmod u+x /docker-run.sh

EXPOSE 8080
    
CMD ["/docker-run.sh"]
