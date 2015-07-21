FILENAME=$1;
global_user=""
message="Detecting OS"
temp="sh /home/$username/Scripts/select_my_os.sh $3;"
while read -r ip username password
do
	if [ "$2" = "copy" ]
	then
		echo "Copying to Remote $ip"   		
		export SSHPASS=$password
		sshpass -e scp -r Scripts ecomm_project.zip $username@$ip:/home/$username
	elif [ "$2" = "env" ]
	then
		echo "RUNNING ENVIRONMENT SETUP SCRIPTS $ip";		
		echo "sh /home/$username/Scripts/select_my_os.sh $3"|sshpass -p$password ssh $username@$ip 
	elif [ "$2" = "deploy" ]
	then
		echo "RUNNING APPLICATION DEPLOYMNET SCRIPTS";		
		echo "sh /home/$username/Scripts/select_my_os.sh $3"|sshpass -p$password ssh $username@$ip 
	fi

done  <$FILENAME
