#!/bin/bash
TaskName=$1;
. ./Deployment_Script/dbconfig;
. ./Deployment_Script/appconfig;
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

