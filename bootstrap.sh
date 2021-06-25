#!/bin/bash

cfgpath="config.toml"

# 是否正式环境，执行ip的读取
if [ "$APP_ENV" == "production" ]; then 

    # 获取当前主机 IP
    hostip=`curl -s ip.gs`
    echo "hostip=$hostip"

    # 生成新的配置文件
    cp config.toml /tmp

    # 替换文件中变量值
    sed -i "s/192.168.50.150/${hostip}/g" /tmp/config.toml

    cfgpath="/tmp/config.toml"

fi


# 启动 go run main.go
go run main.go -c $cfgpath