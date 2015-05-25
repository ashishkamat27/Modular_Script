#!/bin/bash

#################################Variable Declaration###############################
SOURCE_ZIP=$3
DESTINATION=$2
####################### Unzip File into specified directory#########################
echo "###########################################################"
echo "Taking artifact and extactacting into Web Server Directory"
echo "###########################################################"
cp -r ecommerce-cd.zip $DESTINATION
unzip  $DESTINATION $SOURCE_ZIP #given here static path can be changed later
echo "Wait!! Let me go to web server directory"
cd $DESTINATION
sleep 5
echo "Giving executable permission to artifact"
chmod -R 777 ecommerce-cd
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

