#!/bin/bash
source ../appconfig;

echo "###########################################################"
echo "Taking artifact and extactacting into Web Server Directory"
echo "###########################################################"
	rm -rf $PROJECTDIR 
	cd /opt 
	unzip   $ZIPNAME.zip -d $PROJECTDIR
	rm -rf $ZIPNAME.zip  

echo "Giving  permission to artifact"
chmod -R 755 $CONFFILENAME
echo "successfully Deployed"
echo "Check your site on  url $SERVERNAME";



