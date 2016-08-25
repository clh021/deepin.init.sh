#!/bin/bash
apt update
apt upgrade

# Simple setup for configuring Ubuntu quickly.
sudo chmod +x *.sh 
sudo ./installApps.sh
sudo ./installDevelopment.sh
sudo ./installChrome.sh

#sudo apt-get autoremove
