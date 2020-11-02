#!/bin/sh

while true
do
echo -n "Please confirm (y or n) :"
read CONFIRM
case $CONFIRM in
y|Y|YES|yes|Yes) break ;;
n|N|no|NO|No)
echo Aborting - you entered $CONFIRM
exit
;;
*) echo Please enter only y or n
esac
done
echo You entered $CONFIRM. Continuing ...
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash
sudo apt install -y nodejs
echo Complete
