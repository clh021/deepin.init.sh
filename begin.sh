#!/bin/bash
# leehom Chen clh021@gmail.com
# ==================================================
_today=`date +%Y%m%d%H%M%S`

# 该脚本将汇聚所有脚本功能
# 该脚本默认基于本地运作(会检查本地代码，没有就自动下载同步)
# 打包需要备份的内容
# 同步备份
# 初始化重装的系统
MENUS=(init_deepin_system install_something);
INSTALL_MENUS=(alidebian aliubuntu echoclrs)
DOCKER_MENUS=()
# PRE_URL=https://raw.githubusercontent.com/clh021/sh/master/init/
PRE_URL=~/workspace/sh/ #需要提前下载
# ==================================================

init_deepin_system(){
    apt update
    bash ${PRE_URL}init/removeAppsDeepin.sh
    bash ${PRE_URL}init/installAppsDeepin.sh
    bash ${PRE_URL}init/setHosts.sh
    bash ${PRE_URL}init/setAliDns.sh
    bash ${PRE_URL}init/installDocker_.sh
    # curl ${PRE_URL}setBackground.sh | sh #暂时没有作用，请手动修改
    bash ${PRE_URL}init/tips.sh | sh
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
	echo -e "============[ $_today ]=============="
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
}
show_menu;
