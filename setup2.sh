#!/bin/bash -e
#General Setup Script For Raspian Install

#Get Generic Install Script from GitHub
git clone https://github.com/dandrzej80/Raspi-Scripts.git

#Run Generic Scripts
cd Raspi-Scripts
sudo bash basic-setup.sh
cd ..

#Install KegBot and Dependencies
set -e
set -x
sudo bash -c "DEBIAN_FRONTEND=noninteractive apt-get -yq install python-setuptools"
sudo easy_install pip
sudo pip install -U virtualenv
sudo pip install -U --pre kegberry
sudo cp /home/pi/Kegbot/app.py /usr/local/lib/python2.7/dist-packages/kegberry/app.py
sudo bash -c "DEBIAN_FRONTED=noninteractive apt-get -yq update"
sudo bash -c "DEBIAN_FRONTED=noninteractive apt-get -yq upgrade"
sudo bash -c "DEBIAN_FRONTED=noninteractive apt-get -yq install build-essential nginx-light libjpeg-dev supervisor python-setuptools python-dev default-libmysqlclient-dev mysql-server redis-server"
sudo bash -c "DEBIAN_FRONTED=noninteractive apt-get -yq clean"
sudo mysql -u root -p="1234" -e "create database kegbot"
mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql -u root -p=1234 mysql
sudo useradd -G dialout -m kegbot
which virtualenv
sudo su -l kegbot -c "if [ ! -e /home/kegbot/kegbot-server.venv ]; then /usr/local/bin/virutalenv /home/kegbot/kegbot-server.venv; fi"
sudo su -l kegbot -c "if [ ! -e /home/kegbot/kegbot-pycore.venv ]; then /usr/local/bin/virutalenv /home/kegbot/kegbot-pycore.venv; fi"
sudo su -l kegbot -c ". /home/kegbot/kegbot-server.venv/bin/activate && pip install kegbot==1.2.3"
sudo su -l kegbot -c ". /home/kegbot/kegbot-pycore.venv/bin/activate && pip install kegbot-pycore2==1.2.3"
#sudo su -l kegbot -c ". /home/kegbot/kegbot-server.venv/bin/activate && setup-kegbot.py"
