#!/bin/bash
git clone git://git.coding.net/coding/WebIDE.git
cd WebIDE/
git submodule init
git submodule update
#编译并打包前端项目
./ide.sh build
#启动项目
./ide.sh run
#打开浏览器 http://localhost:8080
