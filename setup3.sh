#!/bin/bash -e
#General Setup Script For Raspian Install

#Get Generic Install Script from GitHub
#git clone https://github.com/dandrzej80/Raspi-Scripts.git
sudo apt-get install tightvncserver -y
vncserver #-1234 -1234 -n
mv tightvncserver /etc/init.d
sudo chmod 755 /etc/init.d/tightvncserver
sudo update-rc.d tightvncserver defaults

cd
sudo ed -s /etc/crontab <<< $'$-1 r ./Raspi-Scripts/edit-crontab\nw\nq\n'

#Run Generic Scripts
#cd Raspi-Scripts
#sudo bash basic-setup.sh
#cd ..

#Install KegBot and Dependencies
bash -c "$(curl -fsSL https://raw.github.com/Kegbot/kegberry/master/install.sh)"
