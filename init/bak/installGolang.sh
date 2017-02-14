#!/bin/bash
# wget -c https://storage.googleapis.com/golang/go1.7.1.linux-amd64.tar.gz #似乎替换了IP也无法下载，建议迅雷下载好放在当前目录
tar -C /usr/local -xzf go1.7.1.linux-amd64.tar.gz #安装Golang基本程序
mkdir ~/app/gopath -p
echo 'export GOPATH=~/app/gopath' >> ~/.profile #设置GO程序包环境变量目录
echo 'export GOROOT=/usr/local/go' >> ~/.profile #设置GO主体程序包根目录,bee new 安装的地方
echo 'export PATH=$PATH:$GOROOT/bin:$GOPATH/bin' >> ~/.profile #设置GO主体环境变量
source ~/.profile #使环境变量生效
go env

installGoDevelopmentEnvironment(){
    sudo apt install -y curl git vim ctags
    go get github.com/astaxie/beego
    go get github.com/beego/bee
    # go get github.com/qiangxue/golang-restful-starter-kit
    # go get -u github.com/Masterminds/glide
    mkdir ~/.vim/bundle -p
    git clone https://github.com/farazdagi/vim-go-ide.git ~/.vim_go_runtime
    sh ~/.vim_go_runtime/bin/install
    # curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
    curl -LSso ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
    echo "alias vimgo='vim -u ~/.vimrc.go'" >> ~/.bashrc
    source ~/.bashrc
    echo "Now you can use vimgo command and Maybe You should Exec Command ':GoInstallBinaries'."
}

today=`date +%Y%m%d_%H%M%S`
echo "Would you want to Install Go development environment for Vim?(Y/n)"
read want
[ "$want" == "n" ] && echo 'Not Install Go development environment.' || installGoDevelopmentEnvironment
echo $today

# 更多go相关学习笔记，可参考[这里](https://github.com/clh021/docker.home/tree/master/study/golang)

#curl -sSL https://raw.githubusercontent.com/clh021/sh/master/installGolang.sh | sudo sh
