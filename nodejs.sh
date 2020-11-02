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
echo -ne '...                     (5%)\r'
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash >/dev/null
echo -ne '......                  (66%)\r'
sudo apt install -y nodejs >/dev/null
echo -ne '..........              (100%)\r'
echo -ne '\n'
echo Complete
