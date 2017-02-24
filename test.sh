#!/bin/bash
# leehom Chen clh021@gmail.com
# sed -i 's/\r//' lianghongdev.sh
# ==================================================
# ready
_today=`date +%Y%m%d%H%M%S`
MENUS=(back workspace);
back_workspace(){
	echo 'testing back';
}
back_workspace(){
	echo 'testing workspace';
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