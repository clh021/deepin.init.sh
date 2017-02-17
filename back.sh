#!/bin/bash
# leehom Chen clh021@gmail.com
# sed -i 's/\r//' lianghongdev.sh
# ==================================================
# ready
_today=`date +%Y%m%d%H%M%S`
MENUS=(install_something docker_run_lamp docker_rm_lamp);
#!/bin/bash
#使用方法：在自己Home目录下执行以下命令即可备份关键信息
#curl https://raw.githubusercontent.com/clh021/sh/master/back.sh | sh
#需要跟踪备份的内容
#壁纸
echo 'Pictures/Wallpapers' > backupHome.list
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

echo '.profile' >> backupHome.list
tar -cvpznf homebak.min.`date +%Y%m%d%H%M%S`.tar.gz -T backupHome.list


#可以自己灵活控制多版本并快速移植
echo '.programs' >> backupHome.list
#php软件包
echo '.composer' >> backupHome.list
#npm软件包
#可以自己把握软件版本，同时可快速移植
echo '.npm' >> backupHome.list
#golang软件包
echo '.programs/go1.7.4.linux-amd64' >> backupHome.list
echo '.programs/liteidex30.3.linux32-qt4' >> backupHome.list
echo 'go' >> backupHome.list
#vscode软件包
echo '.config/Code' >> backupHome.list
#浏览器的内容，扩展，收藏，历史记录
echo '.config/google-chrome' >> backupHome.list
tar -cvpznf homebak.`date +%Y%m%d%H%M%S`.tar.gz -T backupHome.list


#浏览器的内容，扩展，收藏，历史记录
echo '.config/google-chrome' > backupHome.list
tar -cvpznf homebak.chrome.`date +%Y%m%d%H%M%S`.tar.gz -T backupHome.list


#可以自己灵活控制多版本并快速移植
echo '.programs/node-v6.9.5-linux-x64' > backupHome.list
#npm软件包
#可以自己把握软件版本，同时可快速移植
echo '.npm' >> backupHome.list
echo '.profile' >> backupHome.list
tar -cvpznf homebak.npm.`date +%Y%m%d%H%M%S`.tar.gz -T backupHome.list


echo '.programs/go1.7.4.linux-amd64' > backupHome.list
echo '.programs/liteidex30.3.linux32-qt4' >> backupHome.list
echo 'go' >> backupHome.list
echo '.profile' >> backupHome.list
tar -cvpznf homebak.go.`date +%Y%m%d%H%M%S`.tar.gz -T backupHome.list

echo '.config/Code' > backupHome.list
tar -cvpznf homebak.vscode.`date +%Y%m%d%H%M%S`.tar.gz -T backupHome.list

rm backupHome.list