#!/bin/bash

# 预设置变量
cfgpath="config.toml"
hostip="192.168.1.109"

# 判断是否 有hostip的环境变量
if [ $HOST_IP ];then
    echo "HOST_IP=$HOST_IP "
    hostip="${HOST_IP}"
elif [ "$APP_ENV" == "production" ]; then
    # 是否正式环境，执行ip的读取
    # 获取当前主机 IP
    hostip=`curl -s ip.gs`
fi

echo "hostip=$hostip"

# 生成新的配置文件
cp config.toml /tmp

# 替换文件中变量值
sed -i "s/192.168.50.150/${hostip}/g" /tmp/config.toml

cfgpath="/tmp/config.toml"

# 启动 go run main.go
go run main.go -c $cfgpath