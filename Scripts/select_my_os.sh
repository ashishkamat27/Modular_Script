user="$(whoami)"
echo $user
uname -a;
if (cat /etc/*-release|grep -iq CentOS)
	then
		echo "Centos is detected \n\n";
		cd /home/$user/Scripts/centos
		sh $1;		
		#sh ecommerce-vhost.sh
	elif (cat /etc/*-release|grep -iq Ubuntu)
	then
		echo "Ubuntu is detected \n\n";
		cd /home/$user/Scripts/ubuntu
		sh $1;		
		#sh ecommerce-vhost.sh
	else 
		echo "Some other";
	fi
