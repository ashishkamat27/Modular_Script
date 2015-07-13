if [ -f /etc/apache2/sites-available/ecomm_project.conf ]; then
echo  "File is already exist"
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


