FILENAME=$1;
global_user="";
while read -r ip username password
do
	printf "Connecting to %s"$ip;
	printf "With username %s"$username;
	printf "Having Password %s "$password
	printf "********************\n\n";
	export SSHPASS=$password
	export global_user=$username;
	echo $global_user;
	./Scripts/select_my_os.sh
	temp=" whoami & pwd cd /home/$username & ls -l & sudo sh Scripts/select_my_os.sh"
	temp1="echo hello world >>/home/$username/Desktop/ashish.txt"
	sshpass -e scp -r Scripts $username@$ip:/home/$username;
	echo $temp|sshpass -p $password ssh -t -t  $username@$ip
	
	#echo "Hello World from Ashish Kamat">>/home/$username/Desktop/; exit
done  <$FILENAME
