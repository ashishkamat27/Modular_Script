FILENAME=$1;
while read -r ip username password
do
	printf "Connecting to %s"$ip;
	printf "With username %s"$username;
	printf "Having Password %s "$password
	printf "********************\n\n";
	export SSHPASS=$password
	sshpass -e scp -r Scripts $username@$ip:/home/$username/Desktop; 
	#echo "Hello World from Ashish Kamat">>/home/$username/Desktop/; exit
done  <$FILENAME
