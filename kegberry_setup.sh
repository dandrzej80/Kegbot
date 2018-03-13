#!/bin/bash -e
#General Setup Script For Raspian Install

#Get Generic Install Script from GitHub
git clone https://github.com/dandrzej80/Raspi-Scripts.git

#Run Generic Scripts
cd Raspi-Scripts
sudo bash basic-setup.sh

#Install KegBot and Dependencies
cd ..
bash install.sh
#bash -c "$(curl -fsSL https://raw.github.com/Kegbot/kegberry/master/install.sh)"
