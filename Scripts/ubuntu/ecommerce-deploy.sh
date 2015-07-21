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
#if 	[ -d /opt/rh/httpd24/root/var/www/html/ecommerce-cd ]; then 
#	echo "Directory exist no need to unzip";
#else 
	rm -rf /var/www/html/ecomm_project
	unzip -d /var/www/html/ /home/$user/ecomm_project.zip   #given here static path can be changed later
#fi 
cd /var/www/html/
sleep 5
echo "Giving executable permission to artifact"
chmod -R 777 ecomm_project
echo "###################################################"
echo " Importing Database"
echo "##################################################"
cd ecomm_project/sql 
pwd
mysql -uroot -proot -e "DROP DATABASE IF EXISTS ecomm"
mysql -uroot -proot <ecomm.sql
mysql -uroot -proot -e "Show databases"
echo "###################################################"
echo " Adding Host Entry in hosts file"
echo "##################################################"
echo  "127.0.0.1 ecomm_project">>/etc/hosts
echo "##################################################"
echo "Restart Apache"
echo "######################################################"
 /etc/init.d/apache2 reload
rm -rf ecomm_project.zip
echo "success Check your site by typing ecommerce-cd in browser"
echo "###############################################"

