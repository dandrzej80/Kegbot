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
export INSTALLFLAGS="--allow_root"
kegberry $INSTALLFLAGS install
sudo cp /home/pi/Kegbot/local_settings.py /home/kegbot/.kegbot/local_settings.py
