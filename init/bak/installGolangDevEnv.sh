#!/bin/bash
sudo apt install -y curl git vim ctags

# 一些必备库
# gocode is used by many editors to provide intellisense
go get github.com/nsf/gocode
# goimports is something you should run when saving code to fill in import paths
go get golang.org/x/tools/cmd/goimports
# gorename is used by many editors to provide identifier rename support
go get golang.org/x/tools/cmd/gorename
# oracle is a tool that help with code navigation and search
go get golang.org/x/tools/cmd/oracle
# golint should be run after every build to check your code
go get github.com/golang/lint/golint

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
