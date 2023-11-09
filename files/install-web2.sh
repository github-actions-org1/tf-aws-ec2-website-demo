#!/bin/bash

sudo yum -y install httpd git 
cd /tmp
git clone https://github.com/cicd-github-action/ecommerce.git
sleep 15s
cp -r /tmp/ecommerce/realestate/* /var/www/html/
sudo systemctl stop httpd
sudo systemctl start httpd
sudo systemctl enable httpd

