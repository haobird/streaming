FROM ubuntu:20.04
LABEL maintainer="xyqbgn@126.com"

RUN sed -i "s/archive\.ubuntu\.com/mirrors.aliyun.com/g" /etc/apt/sources.list
RUN apt-get update 
RUN apt-get install -y software-properties-common 
RUN apt-get install -y language-pack-en
RUN locale-gen en_US.UTF-8
RUN export LANG=en_US.UTF-8
RUN apt-get update
RUN apt-get install -y --no-install-recommends ca-certificates \
    wget \
    vim \
    htop \
    curl \
    sudo \
    git \
    net-tools \
    supervisor \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# 安装 ffmpeg
RUN apt-get install -y ffmpeg
# 验证版本
RUN ffmpeg -version

# 安装node
# RUN curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
# RUN apt install -y nodejs
# RUN npm i -g @langhuihui/monica --unsafe-perm=true

# 安装golang https://golang.google.cn/dl/go1.16.5.linux-amd64.tar.gz
RUN wget -c https://golang.google.cn/dl/go1.16.5.linux-amd64.tar.gz -O - | sudo tar -xz -C /usr/local
ENV PATH=$PATH:/usr/local/go/bin
ENV GOBIN=$GOPATH/bin
ENV GO111MODULE=on
ENV GOPROXY=https://goproxy.io,direct
ENV TZ=Asia/Shanghai
# RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# ENV HOME  "/www"
# RUN mkdir ${HOME}
# WORKDIR ${HOME}/

# RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf"]

CMD ["/bin/sh", "-c", "while true;do echo hello docker;sleep 1;done"]