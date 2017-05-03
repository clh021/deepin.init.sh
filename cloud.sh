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
usermod -aG root www-data && usermod -aG docker www-data && mkdir /var/www
echo 'www-data ALL=(ALL:ALL) ALL' >> /etc/sudoers
apt install libapache2-mod-php5 apache2-doc apache2-doc php-pear docker.io
# ================================================
echo '===============> install firefox'
echo -e "\ndeb http://downloads.sourceforge.net/project/ubuntuzilla/mozilla/apt all main" | sudo tee -a /etc/apt/sources.list > /dev/null
echo 'passwd www-data'
passwd www-data

# sudo apt-get install -y awesome awesome-extra xscreensaver gnome-settings-daemon
