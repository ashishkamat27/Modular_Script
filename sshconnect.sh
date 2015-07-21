FILENAME=$1;
global_user="";
while read -r ip username password
do
	printf "*********************";
	printf "Connecting to %s"$ip;
	printf "********************\n\n";
	export SSHPASS=$password
	temp="sh /home/$username/Scripts/select_my_os.sh"
	sshpass -e scp -r Scripts ecomm_project.zip $username@$ip:/home/$username
	echo "Detecting Operating System\n\n"
	echo $temp|sshpass -p $password ssh $username@$ip 
	#echo $ip;
	#break;
	#echo "Hello World from Ashish Kamat">>/home/$username/Desktop/; exit
done  <$FILENAME
