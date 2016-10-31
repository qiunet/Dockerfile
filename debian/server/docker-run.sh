#! /bin/bash
# qiunet
# qiunet@gmail.com  
# 2016年10月26日 10:47
# 初始化tomcat镜像的配置shell脚本 
#
#---------------BODY-----------------
### 修改tomcat的启动目录 APP_NAME是环境变量里面带过来的`

if [ -n "${APP_NAME}" ];then
	echo ${APP_NAME}
	source /root/.bashrc

	if [ ${APP_NAME} = "back" ] ;then
		sed -i "s/code_front/code_back/g"  /root/apache-tomcat-8.5.6/conf/server.xml
	elif [ ${APP_NAME} = "front" ];then
		# 不需要修改
		echo ""
	else
		echo "APP_NAME is error value"
		exit 1000
	fi

	/root/apache-tomcat-8.5.6/bin/catalina.sh run
else
	echo "APP_NAME is empty"
	exit 1001
fi
