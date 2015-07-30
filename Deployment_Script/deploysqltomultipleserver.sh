#!/bin/bash
. ./Deployment_Script/appconfig;
FILENAME="./Deployment_Script/dbhostfile";
while read -r DBHOST DBUSERNAME DBPASSWORD DBNAME
do
	TaskName=$1;

	cd $PROJECTDIR/SQL/$TaskName;
		if [ 'ls -A $TaskName' ] 
		then
			echo "SQL script is exist in $TaskName";
			for i in `find . -name "*.sql"`;  
			do 
				echo "Currently executing $i file";
				mysql -u$DBUSERNAME -p$DBPASSWORD -h$DBHOST $DBNAME < $i;   
 			done	
		else 
			echo "SQL script does not exists in $TaskName";
		fi

done <$FILENAME;


