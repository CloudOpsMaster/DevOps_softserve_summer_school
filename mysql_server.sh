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
sudo apt install mysql-client mysql-server php libapache2-mod-php
echo "Finished i mysql server "

echo "Restart mysql"
sudo service mysql restart
sudo sleep 3
sudo service mysql status

echo "Seting up mysql .................................................... "
sudo mysql -u root -p

        echo "Create db Moodle"
        CREATE DATABASE moodle DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
        echo "Show databases"
        SHOW DATABASES;
        echo "Create user ... "
        create user 'moodledude'@'%' IDENTIFIED BY 'P@ssw0rd';
        GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,CREATE TEMPORARY TABLES,DROP,INDEX,ALTER ON moodle.* TO 'moodledude'@'%';
        quit;

echo "finished setting up...................................................... "


echo "Updating mysql configs in /etc/mysql/my.cnf."
sudo sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/my.cnf
echo "Updated mysql bind address in /etc/mysql/my.cnf to 0.0.0.0 to allow external connections."

echo "Stop mysql"
sudo service mysql stop
sleep 3

echo "Start mysql"
sudo service mysql start
sleep 3

echo "Restart mysql"
sudo service mysql restart
sleep 3

echo "Setting up ip tables ..............................................................."

sudo iptables -P INPUT DROP
sudo iptables -P OUTPUT DROP
sudo iptables -P FORWARD DROP

# закрываем все соединения
sudo iptables -A INPUT -i lo -j ACCEPT
sudo iptables -A OUTPUT -o lo -j ACCEPT

# разрешаем трафик loopback, нужен обязательно
sudo iptables -A INPUT -p all -m state —state ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A OUTPUT -p all -m state —state NEW,ESTABLISHED,RELATED -j ACCEPT

# разрешаем инициированные программами, системой и их дочерние соединения.
sudo iptables -A INPUT -m state —state INVALID -j DROP
sudo iptables -A FORWARD -m state —state INVALID -j DROP



## далее команды чтобы открыть порт Linux:

sudo iptables -A INPUT -i eth0 -p tcp —dport 80 -j ACCEPT
sudo iptables -A INPUT -i eth0 -p udp —dport 80 -j ACCEPT

# открываем порты для посещения сайтов

# iptables -A INPUT -i eth0 -p tcp —dport «номер нужного входящего порта» -j ACCEPT
# iptables -A OUTPUT -i eth0 -p tcp —dport «номер нужного исходящего порта» -j ACCEPT

sudo iptables -A INPUT -i eth0 -p tcp -m tcp --dport 3306 -j ACCEPT
sudo iptables -A OUTPUT -i eth0 -p tcp -m tcp --dport 3306 -j ACCEPT

echo "Finished set up ip tables _______________________________________________________"


echo "Install net tool ..."
sudo apt install net-tools
echo "Finished i net tool"
echo ""
