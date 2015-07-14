echo $username
if (cat /etc/*-release|grep -iq CentOS)
	then
		echo "Centos";
		cd /home/$username/Scripts/centos
		sh configuration.sh
		#sh ecommerce-deploy.sh
		#sh ecommerce-vhost.sh
	elif (cat /etc/*-release|grep -iq Ubuntu)
	then
		echo "Ubuntu";
		#ifconfig
		cd /home/$username/Scripts/ubuntu
		sh configuration.sh
		#sh ecommerce-deploy.sh
		#sh ecommerce-vhost.sh
	else 
		echo "Some other";
	fi
