unet@gmail.com  
# 2016年10月21日 07:49
# 一键build所有的docker镜像 
#
#---------------BODY-----------------
cd `dirname $0`
currDir=`pwd`

docker build -t qiunet/debian:base ./base
docker build -t qiunet/debian:mysql ./mysql
docker build -t qiunet/debian:java ./java
docker build -t qiunet/debian:server ./server
