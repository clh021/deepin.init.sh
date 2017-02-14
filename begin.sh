#!/bin/bash
# leehom Chen clh021@gmail.com
# sed -i 's/\r//' lianghongdev.sh
# ==================================================
# ready
_today=`date +%Y%m%d%H%M%S`
MENUS=(init_deepin_system back_deepin_system back_deepin_chrome install_something);
INSTALL_MENUS=(alidebian aliubuntu echoclrs)
DOCKER_MENUS=()
# ==================================================

init_deepin_system(){
    apt update
    # PRE_URL=https://raw.githubusercontent.com/clh021/sh/master/init/
    PRE_URL=~/sh/init/ #需要提前下载
    bash ${PRE_URL}removeAppsDeepin.sh
    bash ${PRE_URL}installAppsDeepin.sh
    bash ${PRE_URL}setHosts.sh
    bash ${PRE_URL}setAliDns.sh
    bash ${PRE_URL}installDocker_.sh
    # curl ${PRE_URL}setBackground.sh | sh #暂时没有作用，请手动修改
    bash ${PRE_URL}tips.sh | sh
}
back_deepin_system(){
    cd;
    tar -cvpznf homebak.`date +%Y%m%d%H%M%S`.tar.gz -T ~/sh/back/home
}
back_deepin_chrome(){
    cd;
    tar -cvpznf homebak.chrome.`date +%Y%m%d%H%M%S`.tar.gz -T ~/sh/back/chrome
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
echoclrs(){
    for STYLE in 0 1 2 3 4 5 6 7; do
        for FG in 30 31 32 33 34 35 36 37; do
            for BG in 40 41 42 43 44 45 46 47; do
                CTRL="\033[$STYLE;$FG;${BG}m"
                echo -en "$CTRL"
                echo -n "$STYLE;$FG;$BG"
                echo -en "\033[0m"
            done
            echo
        done
        echo
    done
    # Reset
    echo -e "\033[0m"
}
install_something(){
	echo -e "======[ install on $_today ]======="
	MENUS_CNT=${#INSTALL_MENUS[@]}
	for ((I=0; I<MENUS_CNT; ++I))
    do
        echo -e "$I.${INSTALL_MENUS[I]}\t"
    done
    echo -e "Please select[num]:";
    read menu
    allow="^[0-9]+$";
    if test "$menu" = "" ; then
        exit 0;
    elif [[ "$menu" =~ $allow ]]; then
        if test $menu -lt $MENUS_CNT ; then
            eval ${INSTALL_MENUS[$menu]};
        else
            echoclr red 'Invalid selection';
        fi
    else
        echoclr red 'Please enter a number';
    fi
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
    #if [ "$1" -eq "$1" ] 2>/dev/null
    #then
    #    echo "$1 is an integer !!"
    #else
    #    echo "ERROR: first paramter must be an integer."
}

#begin working
#if test "$1" != "" ; then
#    analy_param $1 $2 $3 $4 $5;
#else
#    show_menu;
#fi
show_menu;
