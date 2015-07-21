#!/bin/bash

#################################Variable Declaration###############################
SOURCE_ZIP=$2
DESTINATION=$3
user="$(whoami)"
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
	rm -rf /opt/rh/httpd24/root/var/www/html/ecomm_project
	unzip -d /opt/rh/httpd24/root/var/www/html/ecomm_project  /home/$user/ecomm_project.zip  #given here static path can be changed later
#fi 
cd /opt/rh/httpd24/root/var/www/html/
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
echo "Virtual Host Configuration"
echo "##################################################"
if [ -f /opt/rh/httpd24/root/etc/httpd/conf.d/ecomm_project.conf ]; then
echo -e "File is already exist"
else

echo -e '<VirtualHost *:80>
    		<Directory "/opt/rh/httpd24/root/var/www/html/ecomm_project">
        	Options Indexes FollowSymLinks Includes ExecCGI
        	Order allow,deny
        	Allow from all
    		</Directory>
    		<IfModule mod_php5.c>
        		php_admin_flag safe_mode Off
        		php_admin_value register_globals 0
        		php_value magic_quotes_gpc 0
        		php_value magic_quotes_runtime 0
        		php_value allow_call_time_pass_reference 0
   		</IfModule>
    		DirectoryIndex index.php
    		DocumentRoot "/opt/rh/httpd24/root/var/www/html/ecomm_project"
    		ServerName ecomm_project
   	</VirtualHost>'>>/opt/rh/httpd24/root/etc/httpd/conf.d/ecomm_project.conf
fi
echo "Restart Apache"
echo "######################################################"
 /etc/init.d/httpd24-httpd graceful
rm -rf ecomm_project.zip
echo "success Check your site by typing ecommerce-cd in browser"
echo "###############################################"
cd /opt/rh/httpd24/root/etc/httpd/conf.d/
#rm -rf ecommerce-cd.conf

