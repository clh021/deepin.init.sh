# Linux.init.sh
Support All linux which is based on debian.

# How to use
```
# eg:deepin
curl -sSL https://raw.githubusercontent.com/clh021/sh/master/deepin.sh | sudo sh
```
Maybe you should install `curl` By `sudo apt install -y curl`

# Backup home
```
curl https://raw.githubusercontent.com/clh021/sh/master/backupHome.sh | sh
```
# Backup chrome
```
tar -cvpznf homebak.chrome.`date +%Y%m%d%H%M%S`.tar.gz .config/google-chrome
```
# Host tool
```
curl -sSL https://raw.githubusercontent.com/racaljk/hosts/master/tools/lhosts | sudo sh
```

# Notice
You probably need to modify the "_" at the end of the file.
