cd ../migrate;
pwd;
for i in `find . -name "*.sql"`;  
do 
	mysql -e "source `expr ${i:2}`" -uroot -proot ;  
done
