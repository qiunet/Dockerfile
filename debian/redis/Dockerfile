FROM qiunet/debian:base
MAINTAINER qiunet qiunet@gmail.com

COPY redis-3.2.4.tar.gz /root/
COPY redis.conf /root/
RUN apt-get -y update && apt-get install -y gcc && \
    cd && tar xzf redis-3.2.4.tar.gz && cd redis-3.2.4 && make && \
    rm ~/redis-3.2.4.tar.gz  

EXPOSE 6379

