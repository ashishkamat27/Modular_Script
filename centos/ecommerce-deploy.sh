#!/bin/bash

#################################Variable Declaration###############################
SOURCE_ZIP=$2
DESTINATION=$3
####################### Unzip File into specified directory#########################
echo "###########################################################"
echo "Taking artifact and extactacting into Web Server Directory"
echo "###########################################################"
#cp  ecommerce-cd.zip  /opt/rh/httpd24/root/var/www/html
echo "Wait!! Let me go to web server directory"
pwd
unzip -d /opt/rh/httpd24/root/var/www/html/ecommerce-cd  ../ecommerce-cd.zip   #given here static path can be changed later
cd /opt/rh/httpd24/root/var/www/html/
sleep 5
echo "Giving executable permission to artifact"
chmod -R 777 ecommerce-cd
echo "###################################################"
echo " Importing Database"
echo "##################################################"
cd ecommerce-cd/sql 
pwd
mysql -uroot -proot <ecomm.sql
mysql -uroot -proot -e "Show databases"
echo "###################################################"
echo " Adding Host Entry in hosts file"
echo "##################################################"
echo  "127.0.0.1 ecommerce-cd">>/etc/hosts
echo "##################################################"
echo "Restart Apache"
echo "######################################################"
service httpd24-httpd graceful
rm -rf ecommerce-cd.zip
echo "success Check your site by typing ecommerce-cd in browser"
echo "###############################################"
cd /opt/rh/httpd24/root/etc/httpd/conf.d/
#rm -rf ecommerce-cd.conf

