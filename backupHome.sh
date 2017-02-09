#!/bin/bash
#curl https://raw.githubusercontent.com/clh021/sh/master/backupHome.sh | sudo sh
#需要跟踪备份的内容
#浏览器的内容，扩展，收藏，历史记录
echo '.config/google-chrome' >> backupHome.list
#候选字数从5修改为9
echo '.config/SogouPY/sogouEnv.ini' >> backupHome.list
echo '.config/fcitx/config' >> backupHome.list
#开机启动配置备份
echo '.config/autostart' >> backupHome.list
echo '.config/deepin/dde-launcher-app-autostart.conf' >> backupHome.list
#git配置
echo '.gitconfig' >> backupHome.list
#bash配置
echo '.bashrc' >> backupHome.list
#vim配置
echo '.vimrc' >> backupHome.list
#ssh配置
echo '.ssh' >> backupHome.list
#npm软件及包
#可以自己把握软件版本，同时可快速移植
echo '.npm' >> backupHome.list
#php软件及包
#可以自己灵活控制多版本并快速移植
echo '.composer' >> backupHome.list
tar -cvpznf homebak.`date +%Y%m%d%H%M%S`.tar.gz -T backupHome.list
rm backupHome.list
