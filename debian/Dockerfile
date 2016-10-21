FROM debian:jessie
MAINTAINER qiunet qiunet@gmail.com

RUN echo "root:123456" | chpasswd

RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak && \
    echo "deb http://mirrors.163.com/debian/ jessie main non-free contrib" >/etc/apt/sources.list && \
    echo "deb http://mirrors.163.com/debian/ jessie-proposed-updates main non-free contrib" >>/etc/apt/sources.list && \
    echo "deb-src http://mirrors.163.com/debian/ jessie main non-free contrib" >>/etc/apt/sources.list && \
    echo "deb-src http://mirrors.163.com/debian/ jessie-proposed-updates main non-free contrib" >>/etc/apt/sources.list && \
    echo "deb-src http://nginx.org/packages/debian/ jessie nginx" >> /etc/apt/sources.list && \
    echo "deb http://nginx.org/packages/debian/ jessie nginx" >> /etc/apt/sources.list

ENV TZ "Asia/Shanghai"
ENV TERM xterm

RUN apt-get -y update && \
apt-get install -y pwgen man \
                   curl ca-certificates \
                   librecode0 libsqlite3-0 \
                   libxml2 vim \
                   openssh-server make \
                   wget net-tools && \
    mkdir -p /var/run/sshd && \
    sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && \
    sed -i "s/PermitRootLogin without-password/PermitRootLogin yes/g" /etc/ssh/sshd_config && \
    apt-get clean && \
    /etc/init.d/ssh start 

COPY .vimrc /root/

RUN cd && \
    wget http://download.java.net/java/jdk8u122/archive/b02/binaries/jdk-8u122-ea-bin-b02-linux-x64-03_oct_2016.tar.gz && \
    tar xzf jdk-8u122-ea-bin-b02-linux-x64-03_oct_2016.tar.gz -C jdk-8u122 && rm *.gz && \
    mv jdk-8u122 /lib64/ && rm -rf jdk-8u122 jdk-8u122-ea-bin-b02-linux-x64-03_oct_2016.tar.gz  && \
    echo "export JAVA_HOME=/lib64/jdk-8u122" >> .bashrc && \ 
    echo "export PATH=$JAVA_HOME/bin:$PATH" >> .bashrc && \ 
    echo "export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar" >> .bashrc  && \ 
    echo alias ls='ls --color=auto' >> .bashrc && \
    echo alias ll='ls -l' >> .bashrc && \
    echo alias l='ll -a' >> .bashrc

EXPOSE 22 80

