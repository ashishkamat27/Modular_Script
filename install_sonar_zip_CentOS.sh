#!/bin/bash


##### Prerequisites for running this script #####

#1.	Script only runs on CentOS [RPM based systems].
#2.	Mysql-Server should already be installed and running.

##### Declare variables ##### 


DBNAME=sonar
DBUSER=sonar
DBPASS=sonar
IPADDRESS=`ip route get 8.8.8.8 | awk '{ print $NF; exit }'`
SONAR_VERSION=$3
MACHINE_TYPE=`getconf LONG_BIT`

##### Script to install SonarQube and Sonar-Runner and Configure them (On RPM based systems only) #####

if ! which java > /dev/null; then
   echo -e "Java is not installed!! \c"
   echo -e "Installing Java..."
   sleep 3
   printf "\n\n"
   yum -y install java-1.7.0-openjdk 
   printf "\n\n" 

else
   echo "Java is installed."
   printf "\n\n"
   sleep 3
fi

if ! which mysql > /dev/null; then
   echo -e "MySQL is not installed!! \c"
   echo -e "Installing MySQL..."
   sleep 3
   printf "\n\n"
   if [ $# -eq 0 ]; then
	 echo "No arguments supplied... Using default MySQL Root Password..."
     yum -y install mysql-server
    /etc/init.d/mysqld start
	 mysqladmin -u root password 
     printf "\n\n"
	 
	 echo "**********************************************************************"
	 echo "Creating Sonar Database..."
	 echo "**********************************************************************"
     sleep 3
     printf "\n\n"

     mysql -u root -p$ROOTPW
   
   else 
     echo "Arguments Supplied... Using provided MySQL Password..."
	 yum -y install mysql-server
      /etc/init.d/mysqld start
	 mysqladmin -u root password "$2"
	 printf "\n\n"
	 echo "**********************************************************************"
     echo "Creating Sonar Database..."
	 echo "**********************************************************************"
	 sleep 3
	 printf "\n\n"

	 mysql -u root -p$2 
   fi

else
   echo "MySQL is installed."
   sleep 3
   printf "\n\n"
   if [ $# -eq 0 ]; then
     echo "MySQL Password not supplied... Using default MySQL Password..."
     sleep 3
     printf "\n\n"  
      /etc/init.d/mysqld start
 
     echo "**********************************************************************"
     echo "Creating Sonar Database..."
     echo "**********************************************************************"
     sleep 3
     printf "\n\n"
     mysql -u root -p
	
   else
	 echo "MySQL Password Supplied... Using Supplied MySQL Password to create database..." 
      /etc/init.d/mysqld start
	 echo "**********************************************************************"
     echo "Creating Sonar Database..."
     echo "**********************************************************************"
     sleep 3
     printf "\n\n"
     mysql -u root -p$2 
   fi 
fi

if ! which unzip > /dev/null; then
   echo -e "Unzip is not installed!! \c"
   echo -e "Installing Unzip..."
   sleep 3
   printf "\n\n"
   yum -y install unzip
   printf "\n\n"

else
   echo "Unzip is installed."
   printf "\n\n"
   sleep 3
fi


