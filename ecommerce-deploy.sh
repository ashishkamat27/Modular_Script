#!/bin/bash

#################################Variable Declaration###############################
SOURCE_ZIP=$2
DESTINATION=$3
####################### Unzip File into specified directory#########################
echo "###########################################################"
echo "Taking artifact and extactacting into Web Server Directory"
echo "###########################################################"
cp -r ecommerce-cd.zip "$DESTINATION"
echo "Wait!! Let me go to web server directory"
cd $DESTINATION
unzip $SOURCE_ZIP  $DESTINATION  #given here static path can be changed later
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

