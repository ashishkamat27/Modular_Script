task="";
if [ "$1" = "environment" ]
then 
	task=configuration.sh;
	echo $task;
elif [ "$1" = "deploy" ]
then
	task=app_deploy.sh;
	echo $task;
else "No arguments supplied";
fi

if (cat /etc/*-release|grep -iq CentOS)
	then
		echo "#############################"
		echo "Centos is detected";
		cd /opt/Deployment_Script/centos
		sh $task;
		#rm -rf /opt/Deployment_Script
		echo "#############################"		
	elif (cat /etc/*-release|grep -iq Ubuntu)
	then
		echo "###########################"
		echo "Ubuntu is detected \n\n";
		cd /opt/Deployment_Script/ubuntu
		sh $task;	
		#rm -rf /opt/Deployment_Script
		echo "###########################"	
	else 
		echo "Some other";
	fi
