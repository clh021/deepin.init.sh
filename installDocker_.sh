#!/bin/bash
# curl -sSL https://get.docker.com/ | sudo sh
curl -sSL http://acs-public-mirror.oss-cn-hangzhou.aliyuncs.com/docker-engine/internet | sh -
sudo mkdir -p /etc/systemd/system/docker.service.d 
sudo tee /etc/systemd/system/docker.service.d/mirror.conf <<-'EOF' 
[Service] 
ExecStart= 
ExecStart=/usr/bin/docker daemon -H fd:// --registry-mirror=https://eko4ves3.mirror.aliyuncs.com 
EOF
sudo systemctl daemon-reload 
sudo systemctl restart docker
