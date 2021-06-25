#!/bin/bash

# sleep 2分钟后，发布
echo "sleep 2m"
sleep 2m
ffmpeg -re -stream_loop -1 -i /opt/app/d0015l72y79.mp4 -vcodec copy -acodec copy -f flv rtmp://stream/live/test