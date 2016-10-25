#!/bin/bash
apt update
# apt upgrade
PRE_URL=https://raw.githubusercontent.com/clh021/sh/master/
# curl ${PRE_URL}test/test.sh | sh
curl ${PRE_URL}removeAppsDeepin.sh | sh
curl ${PRE_URL}installAppsDeepin.sh | sh
curl ${PRE_URL}installDevelopment_.sh | sh
curl ${PRE_URL}installFilezilla.sh | sh
curl ${PRE_URL}installRemmina.sh | sh
curl ${PRE_URL}installSublime-textDeepin.sh | sh
# curl ${PRE_URL}installGolang.sh | sh
curl ${PRE_URL}setHost.sh | sh
curl ${PRE_URL}setBackground.sh | sh
curl ${PRE_URL}tips.sh | sh
#sudo apt-get autoremove #deepin中可能引发一些问题
