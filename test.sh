#!/bin/bash
# PRE_URL=https://raw.githubusercontent.com/clh021/sh/master/
# curl ${PRE_URL}test.sh | sh
# curl https://raw.githubusercontent.com/clh021/sh/master/test.sh | sh
wget -c https://raw.githubusercontent.com/racaljk/hosts/master/tools/lhosts
chmod +x lhosts
./lhosts -h
