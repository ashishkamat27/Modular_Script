FILENAME=$1;
global_user="";
while read -r ip username password
do
	printf "*********************";
	printf "Connecting to %s"$ip;
	printf "With username %s"$username;
	printf "Having Password %s "$password
	printf "********************\n\n";
	export SSHPASS=$password
	#ant -Dhost=$ip -Dusername=$username -Dpassword=$password
	#echo $global_user;
	#./Scripts/select_my_os.sh
	temp="sh /home/$username/Scripts/select_my_os.sh"
	#temp1="echo hello world >>/home/$username/Desktop/ashish.txt"
	sshpass -e scp -r Scripts $username@$ip:/home/$username
	#ssh  $username@$ip && whoami
	#sshpass -e sh /home/Scripts/select_my_os.sh
	#echo $ip;
	#echo $temp|sshpass -p $password ssh -t -t $username@$ip 
	echo $temp|sshpass -p $password ssh -t -t  $username@$ip 
	#echo $ip;
	#break;
	#echo "Hello World from Ashish Kamat">>/home/$username/Desktop/; exit
done  <$FILENAME
