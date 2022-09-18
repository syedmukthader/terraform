#!/bin/bash
yum install wget unzip httpd -y
systemctl start httpd
systemctl enable httpd
wget https://templatemo.com/tm-zip-files-2020/templatemo_518_sentra.zip
unzip -o templatemo_518_sentra.zip
cp -r templatemo_518_sentra/* /var/www/html
systemctl restart httpd