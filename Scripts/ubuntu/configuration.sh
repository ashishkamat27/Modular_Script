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
  	apt-get clean all
  	apt-get -y install php5-cli php5-common php5-mysql php5-xdebug libapache2-mod-php5
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
	printf "\n\n"
	if [ $# -eq0 ]; then
		echo "No arguments supplied ..\n Using default root credeantails"
	apt-get clean all
	  apt-get -y install mysql-server
	  /etc/init.d/mysql start
	 mysqladmin -u root -p$ROOTPW
	printf "\n\n"
	
	else 
	echo "Arguments supplied... Using given Mysql password..."
	apt-get clean all
	 apt-get -y install mysql-server
	  /etc/init.d/mysql start
	 mysqladmin -u root -p$2
	printf "\n\n"
	exit
 	fi
else
	echo "MySQL is installed."    
       if [ $# -eq 0 ]; then 
		echo "Mysql password not supplied using default password"
		mysql --version
		 /etc/init.d/mysql start
		#mysql -u root -p$ROOTPW
 		printf "\n\n"
		#exit
      else 
	 	echo "Mysql password is supplied using given password"
		mysql --version
		  /etc/init.d/mysql start
		#mysql -u root -p$2
 		printf "\n\n"
		#exit
     fi
fi
############## Apache Setup ####################
if   	! which apache2 > /dev/null; then
   	echo -e "Apache is not installed! \c"
   	echo "Installinig Apache"
  	sleep 5
  	apt-get clean all
  	  apt-get -y install apache2
	/etc/init.d/apache2 start
else 
	echo "Apache is installed."
	apache2 -v
	 /etc/init.d/apache2 start
	printf "\n\n"
	sleep 5
fi



