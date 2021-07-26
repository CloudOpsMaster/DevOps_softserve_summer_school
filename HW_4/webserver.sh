#!/bin/bash
sudo apt update
sudo apt install apache2
myip='curl http://169.254.169.254/latest/meta-data/local-ipv4'
echo "<h2>WebServer with IP: $myip</h2><br>Build by Terraform for SoftServe!" > /var/www/html/index.html
sudo service apache2 start
sudo service apache2 status