#!/bin/bash
apt update
apt upgrade

# Simple setup for configuring Ubuntu quickly.
sudo chmod +x *.sh 
sudo ./installApps.sh
sudo ./installDevelopment.sh
sudo ./setHost.sh
sudo ./setBackground.sh
#sudo apt-get autoremove

#卸载深度的某些软件