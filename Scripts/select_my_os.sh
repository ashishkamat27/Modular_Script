user="$(whoami)"
echo $user
if (cat /etc/*-release|grep -iq CentOS)
	then
		echo "Centos is detected \n\n";
		cd /home/$user/Scripts/centos
		sh configuration.sh
		sh ecommerce-deploy.sh
		sh ecommerce-vhost.sh
	elif (cat /etc/*-release|grep -iq Ubuntu)
	then
		echo "Ubuntu is detected \n\n";
		ifconfig
		cd /home/$user/Scripts/ubuntu
		sh configuration.sh
		sh ecommerce-deploy.sh
		sh ecommerce-vhost.sh
	else 
		echo "Some other";
	fi
