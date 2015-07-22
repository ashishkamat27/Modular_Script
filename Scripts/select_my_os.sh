user="$(whoami)"
echo $user
uname -a;
if (cat /etc/*-release|grep -iq CentOS)
	then
		echo "#############################"
		echo "Centos is detected";
		cd /home/$user/Scripts/centos
		sh $1;
		echo "#############################"		
	elif (cat /etc/*-release|grep -iq Ubuntu)
	then
		echo "###########################"
		echo "Ubuntu is detected \n\n";
		cd /home/$user/Scripts/ubuntu
		sh $1;	
		echo "###########################"	
	else 
		echo "Some other";
	fi
