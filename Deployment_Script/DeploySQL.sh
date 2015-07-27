TaskName='';
. ../DBConfig
. ../appconfig
if [ "$1" = "migrate" ]
then
	TaskName="migrate";
elif ["$1" = "rollback"]
then
	TaskName="rollback";
fi

cd $PROJECTDIR/SQL/$TaskName;
if [ 'ls -A $TaskName' ] 
then
		echo "SQL script is exist in $TaskName";
		for i in `find . -name "*.sql"`;  
		do 
			mysql -e -u$DBUSERNAME -p$DBPASSWORD -h$DBHOST $DBNAME<$i
			#mysql -e "source `expr ${i:2}`" -u$DBusername -p$DBpassword -h$DBHost ;  
		done
	        echo "done";
else 
		echo "SQL script does not exists in $TaskName";
fi

