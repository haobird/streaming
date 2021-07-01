FROM haobird/develop:latest
LABEL maintainer="xyqbgn@126.com"

# 设置工作区
WORKDIR "/opt"

# 把全部文件添加到/opt目录
ADD . .

# 启动服务
CMD ["/opt/app/ffmpeg.sh"]
# CMD ["/bin/sh", "-c", "while true;do echo hello docker;sleep 1;done"]