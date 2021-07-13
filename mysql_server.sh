#!/bin/bash
echo "Update ...."
sudo apt update
echo "Finished update "

echo "Upgrade ... "
sudo apt upgrade
echo "Finished upgrade"

echo "Install mc ..."
sudo apt install mc
echo "Finished i mc "

echo "Install vs code ..."
sudo snap install --classic code
echo "Finished i vs code"

echo "Install my sql server ..."
sudo apt install mysql-server
sudo mysql_secure_installation
sudo mysqladmin -p -u root version
echo "Finished i mysql server "

echo "Install net tool ..."
sudo apt install net-tools
echo "Finished i net tool"
