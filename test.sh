#!/bin/bash
# PRE_URL=https://raw.githubusercontent.com/clh021/sh/master/
# curl ${PRE_URL}test.sh | sh
# curl https://raw.githubusercontent.com/clh021/sh/master/test.sh | sh
sudo tee ~/mirror.conf <<-'EOF' 
[Service] 
ExecStart= 
ExecStart=/usr/bin/docker daemon -H fd:// --registry-mirror=https://eko4ves3.mirror.aliyuncs.com 
EOF
ls
git status
