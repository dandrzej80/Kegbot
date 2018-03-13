#!/bin/bash -e
#General Setup Script For Raspian Install

#Get Generic Install Script from GitHub
cd
git clone https://github.com/dandrzej80/Raspi-Scripts.git

#Run Generic Scripts
cd Raspi-Scripts
sudo bash basic-setup.sh

#Install KegBot and Dependencies
#bash -c "$(curl -fsSL https://raw.github.com/Kegbot/kegberry/master/install.sh)"
cd
sudo apt-get install python-dev python-pip libjpeg-dev default-libmysqlclient-dev redis-server mysql-client mysql-server redis-server supervisor nginx -y
sudo pip install virtualenv
sudo mkdir /home/kegbot
sudo virtualenv /home/kegbot/data/kb
source /home/kegbot/data/kb/bin/activate
sudo pip install -U kegbot
sudo pip install -U kegbot
sudo mysqladmin -u root create kegbot
sudo mysql -u root -e 'GRANT ALL PRIVILEGES ON kegbot.* TO kegbot@localhost IDENTIFIED BY "1234"; flush privileges;'
redis-cli ping PONG
