#!/bin/bash
# leehom Chen clh021@gmail.com
# curl -sSL https://raw.githubusercontent.com/clh021/sh/master/cloud.sh | sh
# ==================================================
echo '===============> set www-data'
_today=`date +%Y%m%d%H%M%S`
echo 'alias sw="su www-data"' >> ~/.bashrc
echo 'alias www="chown -Rf www-data:www-data ."' >> ~/.bashrc
sed -i 's/www-data:x:33:33:www-data:\/var\/www:\/usr\/sbin\/nologin/www-data:x:33:33:www-data:\/var\/www:\/bin\/bash/' /etc/passwd
apt update
apt install docker.io sudo
usermod -aG root www-data && usermod -aG docker www-data
mkdir /var/www && chown www-data:www-data /var/www
echo 'www-data ALL=(ALL:ALL) ALL' >> /etc/sudoers
apt install libapache2-mod-php5 apache2-doc apache2-doc php-pear docker.io firefox-esr
wget -c "http://pinyin.sogou.com/linux/download.php?f=linux&bit=64" -O sogou.deb && sudo gdebi -n sogou.deb
# ================================================
echo '===============> set passwd www-data'
passwd www-data

# sudo apt-get install -y awesome awesome-extra xscreensaver gnome-settings-daemon
