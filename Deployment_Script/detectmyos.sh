#!/bin/bash
task="";
if [ "$1" = "environment" ]
then 
	task=configuration.sh;
elif [ "$1" = "deploy" ]
then
	task=app_deploy.sh;
else "No arguments supplied";
fi


if (cat /etc/*-release|grep -iq CentOS)
	then
		echo "#############################"
		echo "Centos is detected";
		cd /opt/Deployment_Script/centos
		sh $task;
		echo "#############################"		
	elif (cat /etc/*-release|grep -iq Ubuntu)
	then
		echo "###########################"
		echo "Ubuntu is detected \n\n";
		cd /opt/Deployment_Script/ubuntu
		sh $task;	
		echo "###########################"	
	else  
		echo "Host have some other OS";
		exit
	fi
