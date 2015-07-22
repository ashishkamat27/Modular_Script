############################################################
	Variable Declartion
###########################################################
FILENAME=$1;
temp="sh /home/$username/Scripts/select_my_os.sh $3;"
#########################################################
while read -r ip username password
do
	if [ "$2" = "copy" ]
	then
		echo "###################################################################"
		echo "Copying to Remote $ip"   		
		export SSHPASS=$password
		sshpass -e scp -r Scripts ecomm_project.zip $username@$ip:/home/$username
		echo "Succesfully Copied to $ip"
		echo "##################################################################"
	elif [ "$2" = "env" ]
	then
		echo "###################################################################"
		echo "RUNNING ENVIRONMENT SETUP SCRIPTS $ip";		
		echo "sh /home/$username/Scripts/select_my_os.sh $3"|sshpass -p$password ssh $username@$ip 
		echo "Succesfully Created Environment on $ip"
		echo "##################################################################"
	elif [ "$2" = "deploy" ]
	then
		echo "###################################################"		
		echo "RUNNING APPLICATION DEPLOYMNET SCRIPTS on $ip";		
		echo "sh /home/$username/Scripts/select_my_os.sh $3"|sshpass -p$password ssh $username@$ip 
		echo "Succesfully Deployed on $ip"
		echo "##################################################"
	fi

done  <$FILENAME
