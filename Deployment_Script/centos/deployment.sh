#!/bin/bash
source ../appconfig;

echo "###########################################################"
echo "Taking artifact and extactacting into Web Server Directory"
echo "###########################################################"
 		echo $ZIPNAME
	rm -rf $PROJECTDIR 
	#rm -rf $ZIPNAME.zip
	cd /opt 
	unzip   $ZIPNAME.zip -d $PROJECTDIR  #given here static path can be changed later

echo "Giving  permission to artifact"
chmod -R 755 $CONFFILENAME
echo "successfully Deployed"



