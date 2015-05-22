#!/bin/bash
ROOTPW=root
	
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
	head -n3 /opt/rh/php55/enable>>.bash_profile
  	printf "\n\n"

else 
	echo "Php is installed."
	printf "\n\n"
	sleep 5
fi


############## MySQL installation ####################
echo "#######################################################"
echo "Installing Php"
echo "#######################################################"
if 	! which mysql>/dev/null; then 
	echo -e "Mysql is not installed!! \c"
	echo -e "Installing Mysql..."
	sleep 5
	printf "\n\n"
	if [ $# -eq0 ]; then
		echo "No arguments supplied ..\n Using default root credeantails"
	yum clean all
	sudo yum -y install mysql-server
	sudo service mysqld start
	#mysql -u root -p$ROOTPW
	printf "\n\n"
	
	else 
	echo "Arguments supplied... Using given Mysql password..."
	yum clean all
	sudo yum -y install mysql-server
	sudo service mysqld start
	#mysql -u root -p$2
	printf "\n\n"
 	fi
else
	echo "MySQL is installed."    
       if [ $# -eq 0 ]; then 
		echo "Mysql password not supplied using default password"
		sudo service mysqld start
		#mysql -u root -p$ROOTPW
 		printf "\n\n"
      else 
	 	echo "Mysql password is supplied using given password"
		sudo service mysqld start
		#mysql -u root -p$2
 		printf "\n\n"
     fi
fi
############## Apache Setup ####################

sudo setenforce 0
sudo service httpd24-httpd start


