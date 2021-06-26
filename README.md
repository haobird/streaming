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

```
http://192.168.50.150:2020/live/test.flv
http://192.168.50.150:2020/34020000001320000002/34020000001340000001.flv
http://192.168.50.150:2020/34020000001320000002/34020000001310000003.flv
http://192.168.50.150:2020/34020000001320000005/34020000001320000006.flv
```

34020000001320000006
34020000002000000001