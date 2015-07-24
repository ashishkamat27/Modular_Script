#!/bin/bash
source ../appconfig
echo $SERVERNAME $PROJECTDIR $INDEX $HOSTNAME  
echo "###########################################################"
echo "Taking artifact and extactacting into Web Server Directory"
echo "###########################################################"
 		echo $ZIPNAME
	rm -rf $PROJECTDIR 
	cd /opt 
	unzip   $ZIPNAME.zip -d $PROJECTDIR  #given here static path can be changed later

echo "Giving  permission to artifact"
chmod -R 750 $CONFFILENAME
echo "successfully Deployed"



