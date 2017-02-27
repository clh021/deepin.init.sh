#!/bin/bash
# leehom Chen clh021@gmail.com
# ==================================================
_today=`date +%Y%m%d%H%M%S`

#需要跟踪备份的内容

#壁纸
#候选字数从5修改为9
#开机启动配置备份
#git配置
#bash配置
#vim配置
#ssh配置
min='
	Pictures/Wallpapers/_bg.jpg
	.config/SogouPY/sogouEnv.ini
	.config/fcitx/config
	.config/autostart
	.config/deepin/dde-launcher-app-autostart.conf
	.gitconfig
	.bashrc
	.vimrc
	.ssh
	'
chrome='.config/google-chrome';
golang='
	.programs/go1.7.4.linux-amd64
	go
	'
npm='
	.programs/node-v6.9.5-linux-x64
	.npm
	'
vscode='
	.config/Code
	'
workspace='
	workspace
	'
envfiles='
	.profile
	'
back_home(){
	cd;
	tar -cvpznf ~/homebak.${_today}.tar.gz ${chrome}${golang}${min}${npm}${vscode}${workspace}${envfiles};
	cd -;
	echo '您的文档内容已打包到~/homebak.'${1}'.'${_today}'.tar.gz'
	echo '-----------------------------';
	ls -lah ~ | grep .tar.gz | grep homebak;
}
MENUS=(back_partOfAll back_home back_chrome back_golang back_npm back_workspace);

backing(){
	cd;
	eval bakList=\${$1}
	tar -cvpznf ~/homebak.${1}.${_today}.tar.gz ${bakList}${envfiles};
	cd -;
	echo '您的'${1}'文档内容已打包到~/homebak.'${1}'.'${_today}'.tar.gz'
	echo '-----------------------------';
	ls -lah ~ | grep .tar.gz | grep homebak;
}
back_chrome(){
	backing chrome
}
back_golang(){
	backing golang
}
back_npm(){
	backing npm
}
back_workspace(){
	backing workspace
}
back_partOfAll(){
	back_chrome
	back_golang
	back_npm
	back_workspace
	back_home
}
echoclr(){
	case $1 in
	'red')
		echo -e "\033[31m$2\033[0m"
	;;
	'blue')
		echo -e "\e[1;34m$2\e[0m"
	;;
	'green')
		echo -e "\e[1;32m$2\e[0m"
	;;
	*)
		echo "$2"
		esac
}
show_menu(){
	echo -e "============[ `date +%F_%T` ]=============="
	MENUS_CNT=${#MENUS[@]}
	for ((I=0; I<MENUS_CNT; ++I))
    do
        echo -e "$I.${MENUS[I]}\t"
    done
    echo -e "Please select[num]:";
    read menu
    allow="^[0-9]+$";
    if test "$menu" = "" ; then
        exit 0;
    elif [[ "$menu" =~ $allow ]]; then
        if test $menu -lt $MENUS_CNT ; then
            eval ${MENUS[$menu]};
        else
            echoclr red 'Invalid selection';
        fi
    else
        echoclr red 'Please enter a number';
    fi
    show_menu;
    #if [ "$1" -eq "$1" ] 2>/dev/null
    #then
    #    echo "$1 is an integer !!"
    #else
    #    echo "ERROR: first paramter must be an integer."
}
show_menu;

# 历史编写函数，留自日后或可用，或改进，或启发，便是极好的
# generateBacklistByModuleName(){
# 	eval bak_module=\${$1}
# 	array=($bak_module)
# 	length=${#array[@]}
# 	for ((i=0; i<$length; i++))
# 	do
# 	    echo ${array[$i]} # >> /tmp/tmp_bak_list
# 	done
#     # cd;
#     # tar -cvpznf ~/homebak.min.${_today}.tar.gz -T ${PRE_URL}back/tmp_bak_list
# }
# backingByList(){
# 	# echo $1
# 	# eval bak_module=\${1}
# 	bak_module=${1}
# 	array=($bak_module)
# 	length=${#array[@]}
# 	for ((i=0; i<$length; i++))
# 	do
# 	    echo ${array[$i]} # >> /tmp/tmp_bak_list
# 	done
#     # cd;
#     # tar -cvpznf ~/homebak.min.${_today}.tar.gz -T ${PRE_URL}back/tmp_bak_list
# }
# # generateListByModuleName min
# # backingByModuleName $min$npm
