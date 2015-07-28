FILENAME="HostFile"
while read -r ipaddress username password
do
	if [ "$1" = "copy" ]
	then
		echo "###################################################################"
		echo "Copying to Remote $ipaddress"   		
		export SSHPASS=$password
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
	fi

done  <$FILENAME
