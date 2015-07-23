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
	rm -rf /var/www/html/ecomm_project
	unzip -d /var/www/html/ecomm_project /home/$user/ecomm_project.zip   #given here static path can be changed later
#fi 
cd /var/www/html/
sleep 5
echo "Giving executable permission to artifact"
chmod -R 777 ecomm_project
echo "###################################################"
echo " Importing Database"
echo "##################################################"
cd ecomm_project/SQL 
pwd
	sh FindSQL.sh migrate
echo "###################################################"
echo " Adding Host Entry in hosts file"
echo "##################################################"
echo  "127.0.0.1 ecomm_project">>/etc/hosts
echo "##################################################"
echo "Virtual Host Configuration"
echo "###################################################"
if [ -f /etc/apache2/sites-available/ecomm_project.conf ]; then
echo  "conf File is already exist"
else
echo  '<VirtualHost *:80>
    		<Directory "/var/www/html/ecomm_project">
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
    		DocumentRoot "/var/www/html/ecomm_project"
    		ServerName ecomm_project
   	</VirtualHost>'>>/etc/apache2/sites-available/ecomm_project.conf
fi
echo "Enabling Site to view"
a2ensite ecomm_project.conf
echo "Restart Apache"
echo "######################################################"
 /etc/init.d/apache2 reload
rm -rf ecomm_project.zip
echo "Successfully Deployed"
echo "###############################################"

