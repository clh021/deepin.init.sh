#!/bin/bash
apt update
#apt upgrade #升级有可能需要重启
PRE_URL=https://raw.githubusercontent.com/clh021/sh/master/init/
# curl ${PRE_URL}test/test.sh | sh
curl ${PRE_URL}removeAppsDeepin.sh | sh
curl ${PRE_URL}installAppsDeepin.sh | sh
# curl ${PRE_URL}installDevelopment_.sh | sh #采用新的备份方案，故在install中安装，配置使用备份方案，更简洁
curl ${PRE_URL}setHosts.sh | sh
curl ${PRE_URL}setAliDns.sh | sh
# curl https://raw.githubusercontent.com/racaljk/hosts/master/tools/lhosts | sh
# curl ${PRE_URL}installGolang.sh | sh
curl ${PRE_URL}installDocker_.sh | sh
# curl ${PRE_URL}setBackground.sh | sh #暂时没有作用，请手动修改
curl ${PRE_URL}tips.sh | sh
#sudo apt-get autoremove #deepin中可能引发一些问题
