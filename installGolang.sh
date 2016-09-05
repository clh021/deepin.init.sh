#!/bin/bash
#wget -c https://storage.googleapis.com/golang/go1.7.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.7.linux-amd64.tar.gz #安装Golang基本程序
echo 'export GOPATH=/app/gopath' >> ~/.profile #设置GO程序包环境变量目录
echo 'export GOROOT=/usr/local/go' >> ~/.profile #设置GO主体程序包根目录
echo 'export PATH=$PATH:$GOROOT/bin:$GOPATH/bin' >> ~/.profile #设置GO主体环境变量
source ~/.profile #使环境变量生效

go get github.com/astaxie/beego
go get github.com/beego/bee