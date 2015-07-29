#!/bin/bash
. ../appconfig;
echo "#################################################" 
echo "Deploying Application"
	sh deployment.sh
echo "#######################################"
echo "Creating Symbolic Link"
echo "######################################"
unlink $PROJECTDIR
ln -s $PROJECTDIR $SYMPATH 
echo "######################################"
echo "Creating Host Configuration File"
echo "#####################################"
rm -rf $CONFFILEPATH_UBUNTU/$CONFFILENAME.conf
echo "<VirtualHost *:$SERVERPORT>
    		<Directory $SYMPATH/$CONFFILENAME>
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
    		DirectoryIndex $DIR_INDEX
    		DocumentRoot $SYMPATH/$CONFFILENAME
    		ServerName $SERVERNAME
   	</VirtualHost>">>$CONFFILEPATH_UBUNTU/$CONFFILENAME.conf
echo "Creating Entry in Host file"
echo  "$SERVERIP $SERVERNAME">>/etc/hosts
echo "Now Enabling Site to view"
a2ensite $CONFFILENAME.conf
echo "Reloading Apache"
service apache2 reload



