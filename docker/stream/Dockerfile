FROM haobird/develop:latest
LABEL maintainer="xyqbgn@126.com"

# 设置工作区
WORKDIR "/opt"

# 把全部文件添加到/opt目录
ADD . .

# 编译：把cmd/main.go编译成可执行的二进制文件，命名为app
# RUN GOOS=linux CGO_ENABLED=0 GOARCH=amd64 go build -ldflags="-s -w" -installsuffix cgo -o app cmd/main.go

# 启动服务
# CMD ["/opt/bootstrap.sh"]
CMD ["/bin/sh", "-c", "while true;do echo hello docker;sleep 1;done"]