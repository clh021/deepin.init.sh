#!/bin/bash
#set host by https://raw.githubusercontent.com/racaljk/hosts/master/hosts
echoredcn(){
	echo -e "\033[31m$*\033[0m"
	return 0
}

#YFILE=~/hosts.y.bak
#if [ -f $YFILE ]; then
#   	echo "File '$YFILE' Exists"
#else
#   	echoredcn "The File '$YFILE' Does Not Exist, Now Bak it AND Don\`t Del it."
#   	echo '#First Hosts Bak And Don\`t Del it.' > $YFILE
#	cat /etc/hosts >> $YFILE
#fi
#sudo cp /etc/hosts ~/hosts.$(date +%Y%m%d%H%M%S).bak
#sudo cp /etc/hosts /etc/hosts.$(date +%Y%m%d%H%M%S).bak
#wget -c https://raw.githubusercontent.com/racaljk/hosts/master/hosts
#cat $YFILE >> hosts #后期如果发现问题则需要将 YFILE存于文件开头
#sudo cp hosts /etc/hosts

echoredcn "Maybe you want to do this command\necho `127.0.1.1   lc` >> /etc/hosts"
