# streaming
视频流处理

## 项目

- ffmpeg 持续推流生成测试地址
- stream 视频流的处理服务
- ga1400 截图上传的服务

## 命令

```
ffmpeg -re -stream_loop -1 -i app/d0015l72y79.mp4 -vcodec copy -acodec copy -f flv rtmp://localhost/live/test
ffmpeg -re -stream_loop -1 -i app/34020000001320000005.flv -vcodec copy -acodec copy -f flv rtmp://localhost/live/test
```

## 示例数据

```
示例url：（摄像头数据流）
预约url：http://82.157.107.86:8080/api/gb28181/invite?id=34020000001320000005&channel=34020000001320000005
播放url：http://82.157.107.86:2020/34020000001320000005/34020000001320000005.flv


http://192.168.50.150:2020/live/test.flv
http://192.168.50.150:2020/34020000001320000002/34020000001340000001.flv
http://192.168.50.150:2020/34020000001320000002/34020000001310000003.flv
http://192.168.50.150:2020/34020000001320000005/34020000001320000006.flv
```

34020000001320000006
34020000002000000001

## 部署

```
① 构造镜像
docker build -t haobird/stream:latest -f docker/stream/Dockerfile .
# docker build -t haobird/ffmpeg:latest -f zone/ffmpeg/Dockerfile . 

② 测试运行
docker run --name stream_test haobird/stream
docker exec -it ffmpeg_test /bin/sh 

③ 推送到远程
docker push  haobird/stream:latest
# docker push  haobird/ffmpeg:latest

```

