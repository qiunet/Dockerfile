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
    echo "alias ls='ls --color=auto'" >> /etc/bash.bashrc && \
    echo "alias ll='ls -l'" >> /etc/bash.bashrc && \
    echo "alias l='ls -la'" >> /etc/bash.bashrc

COPY .vimrc /root/
COPY iptables-rules.txt /root/

CMD /etc/init.d/ssh start

EXPOSE 22 
