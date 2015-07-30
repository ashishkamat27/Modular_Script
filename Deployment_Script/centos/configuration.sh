#!/bin/bash
############### Php 5.5.6 Installation ######################
			
echo "#######################################################"
echo "Installing Php"
echo "#######################################################"
if   	! which php > /dev/null; then
   	echo -e "Php is not installed! \c"
   	echo "Installinig Php and php-mysql..."
  	sleep 5
  	yum clean all
  	sudo yum -y install php55-php php55-php-mysql php55-php-pecl-xdebug
	cd ~
	head -n3 /opt/rh/httpd24/enable>>.bashrc
	head -n3 /opt/rh/php55/enable>>.bashrc
	echo "export PATH=/opt/rh/php55/root/usr/bin:/opt/rh/php55/root/usr/sbin${PATH:+:${PATH}}
	export MANPATH=/opt/rh/php55/root/usr/share/man:${MANPATH}">>.bashrc
	source ~/.bashrc
  	printf "\n\n"

else 
	echo "Php is installed."
	php -v
	printf "\n\n"
	sleep 5
fi


############## MySQL installation ####################
echo "#######################################################"
echo "Installing MYsql"
echo "#######################################################"
if 	! which mysql>/dev/null; then 
	echo -e "Mysql is not installed!! \c"
	echo -e "Installing Mysql..."
	sleep 5
	yum clean all
	 yum -y install mysql-server
	/etc/init.d/mysqld start	
 	fi
else
	echo "MySQL is installed."    
       	mysql --version
	/etc/init.d/mysqld start
fi
############## Apache Setup ####################
echo "Making Firewall rules to permissive";
	setenforce 0
  	/etc/init.d/httpd24-httpd start
echo " started httpd server";
