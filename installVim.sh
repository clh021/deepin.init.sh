#!/bin/bash
sudo apt install -y vim
sudo apt install -y ctags
today=`date +%Y%m%d%H%M`
echo "Would you want to Install Go development environment for Vim?(Y/n)"
read want
echocn "完成后自动重启吗？(y/N)"
read auto_reboot
[ "$auto_reboot" == "n" ] && sudo installGoDevelopmentEnvironment || echo 'Not Install Go development environment.'
installGoDevelopmentEnvironment(){
    mkdir ~/.vim/bundle
    #...
}
#curl -sSL https://raw.githubusercontent.com/clh021/sh/master/installVim.sh | sudo sh
