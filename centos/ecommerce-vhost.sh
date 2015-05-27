if [ -f /opt/rh/httpd24/root/etc/httpd/conf.d/ecommerce-cd.conf ]; then
echo -e "File is already exist"
else

echo -e '<VirtualHost *:80>
    		<Directory "/opt/rh/httpd24/root/var/www/html/ecommerce-cd">
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
    		DocumentRoot "/opt/rh/httpd24/root/var/www/html/ecommerce-cd"
    		ServerName ecommerce-cd
   	</VirtualHost>'>>/opt/rh/httpd24/root/etc/httpd/conf.d/ecommerce-cd.conf
fi


