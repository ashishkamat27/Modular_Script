#!/bin/bash
FILENAME="hostfile"
while read -r ipaddress username password
do
	if [ "$1" = "copy" ]
	then
		echo "###################################################################"
		echo "Copying to Remote $ipaddress"   		
		export SSHPASS=$password
		echo $ZIPNAME;
		sshpass -e scp -r Deployment_Script $ZIPNAME.zip $username@$ipaddress:/opt
		echo "Succesfully Copied to $ipaddress"
		echo "##################################################################"
	elif [ "$1" = "environment" ]
	then
		echo "###################################################################"
		echo "RUNNING ENVIRONMENT SETUP SCRIPTS $ipaddress";		
		echo "sh /opt/Deployment_Script/detectmyos.sh environment"|sshpass -p$password ssh $username@$ipaddress
		echo "Succesfully Created Environment on $ipaddress"
		echo "##################################################################"
	elif [ "$1" = "deploy" ]
	then
		echo "###################################################"		
		echo "RUNNING APPLICATION DEPLOYMNET SCRIPTS on $ipaddress";		
		echo "sh /opt/Deployment_Script/detectmyos.sh deploy"|sshpass -p$password ssh $username@$ipaddress 
		echo "Succesfully Deployed on $ipaddress"
		echo "##################################################"
	else
		echo "No arguments Supplied";
	fi

done  <$FILENAME

if [ "$1" = "migrate" ]
then
	echo "#################################";	
	echo "Deploying on Single DB Server";
	sh Deployment_Script/deploysql.sh $1; 
	echo "#################################";
	echo "Mutiple DB Servers";
	sh Deployment_Script/deploysqltomultipleserver.sh $1;
	echo "###################################";
elif [ "$1" = "rollback" ]
then
	echo "#################################";	
	echo "For Deploying on Single DB Server";
	sh Deployment_Script/deploysql.sh $1; 
	echo "#################################";
	echo "For Mutiple DB Servers";
	sh Deployment_Script/deploysqltomultipleserver.sh $1;
	echo "###################################";
else
		echo "No arguments Supplied";
fi

