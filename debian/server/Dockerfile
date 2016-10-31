FROM qiunet/debian:base
MAINTAINER qiunet qiunet@gmail.com

COPY apache-tomcat-8.5.6.tar.gz /root/
COPY docker-run.sh /

RUN cd && \
    wget http://download.java.net/java/jdk8u122/archive/b02/binaries/jdk-8u122-ea-bin-b02-linux-x64-03_oct_2016.tar.gz && \
    tar xzf jdk-8u122-ea-bin-b02-linux-x64-03_oct_2016.tar.gz && \
    mv jdk1.8.0_122 /lib64/ && rm jdk-8u122-ea-bin-b02-linux-x64-03_oct_2016.tar.gz  && \
    echo "export JAVA_HOME=/lib64/jdk1.8.0_122" >> .bashrc && \ 
    echo "export PATH=/lib64/jdk1.8.0_122/bin:$PATH" >> .bashrc && \ 
    echo "export CLASSPATH=.:/lib64/jdk1.8.0_122/lib/dt.jar:$JAVA_HOME/lib/tools.jar" >> .bashrc 

RUN cd /root/ && tar xzf apache-tomcat-8.5.6.tar.gz && rm *.tar.gz && chmod u+x /docker-run.sh

EXPOSE 8080
    
CMD ["/docker-run.sh"]
