#!/bin/bash
yum install wget unzip httpd -y
systemctl start httpd
systemctl enable httpd
wget https://templatemo.com/tm-zip-files-2020/templatemo_510_letter.zip
unzip -o templatemo_510_letter.zip
cp -r templatemo_510_letter.zip/* /var/www/html
systemctl restart httpd