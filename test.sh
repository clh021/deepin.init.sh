#!/bin/bash
# PRE_URL=https://raw.githubusercontent.com/clh021/sh/master/
# curl ${PRE_URL}test.sh | sh
# curl https://raw.githubusercontent.com/clh021/sh/master/test.sh | sh
#wget -c https://raw.githubusercontent.com/racaljk/hosts/master/tools/lhosts
#chmod +x lhosts
#./lhosts -h

if [ ! -z "$RANGE" ]; then
  # Range mode on
  echo 'Range mode on'
  #sed -n "$RANGE"p "$HOSTS" > "$swp"
else
  # Range mode off, auto set marker if no marker in the local hosts file.
  if [ ! cat /etc/hosts | grep 'lc' ]; then
    echo 'not find lc and set marker'
  fi
  # Range mode off, handle marker in the local hosts file.
  #if grep -q "$BEGIN_MARK" "$HOSTS"; then
    #sed "/$BEGIN_MARK/,/$END_MARK/d" "$HOSTS" >> "$swp"
  #fi
fi
