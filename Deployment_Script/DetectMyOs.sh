user="$(whoami)"
if[$1 = "env"]
$command= configuration.sh;
elif [$1 = "deploy"]
$command = deploy.sh;
fi
echo $user
uname -a;
if (cat /etc/*-release|grep -iq CentOS)
	then
		echo "#############################"
		echo "Centos is detected";
		cd /home/$user/Scripts/centos
		sh $command;
		echo "#############################"		
	elif (cat /etc/*-release|grep -iq Ubuntu)
	then
		echo "###########################"
		echo "Ubuntu is detected \n\n";
		cd /home/$user/Scripts/ubuntu
		sh $command;	
		echo "###########################"	
	else 
		echo "Some other";
	fi
