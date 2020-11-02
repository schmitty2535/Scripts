#!/bin/sh

while true
do
echo -n "Please confirm that you wish to run setup as specified in the github documentation(y or n) :"
read CONFIRM
case $CONFIRM in
y|Y|YES|yes|Yes) break ;;
n|N|no|NO|No)
echo Canceling 
exit
;;
*) echo Please enter a valid input y or n
esac
done

echo Beginning Setup Process

sudo systemctl enable ssh
sudo systemctl start ssh
sudo systemctl start vncserver-x11-serviced.service
sudo systemctl enable vncserver-x11-serviced.service
echo 'dtparam=spi=on' | sudo tee -a /boot/config.txt > /dev/null
dtparam=spi=on >> /boot/config.txt
dtparam=i2c_arm=on >> /boot/config.txt
dtoverlay=pi3-disable-bt >> /boot/config.txt
hdmi_force_hotplug=1 >> /boot/config.txt
sudo systemctl disable hciuart

curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash
sudo apt install -y nodejs

sudo npm install -g pm2

echo Complete
