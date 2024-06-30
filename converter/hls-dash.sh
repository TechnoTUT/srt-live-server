#!/bin/bash

# 出力ディレクトリを作成
mkdir -p /output/dash

# 削除
rm -f /output/dash/*

# DASH出力
ffmpeg \
-i udp://srt-listener:5000 \
-preset ultrafast -tune zerolatency -flags +global_header \
-c:v libx264 -b:v 5000k -pix_fmt yuv420p \
-c:a aac -b:a 128k -ac 2 -ar 44100 \
-use_timeline 1 \
-use_template 1 \
-window_size 5 \
-adaptation_sets "id=0,streams=v id=1,streams=a" \
-streaming 1 \
-seg_duration 1 \
-remove_at_exit 1 \
/output/dash/manifest.mpd
