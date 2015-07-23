FILENAME="HostFile"
while read -r ipaddress username password
do
	if [ "$1" = "copy" ]
	then
		echo "###################################################################"
		echo "Copying to Remote $ipaddress"   		
		export SSHPASS=$password
		sshpass -e scp -r Scripts ecomm_project.zip $username@$ip:/home/$username
		echo "Succesfully Copied to $ipaddress"
		echo "##################################################################"
	elif [ "$1" = "environment" ]
	then
		echo "###################################################################"
		echo "RUNNING ENVIRONMENT SETUP SCRIPTS $ipaddress";		
		echo "sh /home/$username/Scripts/select_my_os.sh environment"|sshpass -p$password ssh $username@$ip 
		echo "Succesfully Created Environment on $ipaddress"
		echo "##################################################################"
	elif [ "$1" = "deploy" ]
	then
		echo "###################################################"		
		echo "RUNNING APPLICATION DEPLOYMNET SCRIPTS on $ipaddress";		
		echo "sh /home/$username/Scripts/select_my_os.sh deploy"|sshpass -p$password ssh $username@$ip 
		echo "Succesfully Deployed on $ipaddress"
		echo "##################################################"
	fi

done  <$FILENAME
