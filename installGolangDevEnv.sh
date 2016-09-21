#!/bin/bash
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
