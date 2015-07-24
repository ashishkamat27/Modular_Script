#!/bin/bash
. ../appconfig
echo $SERVERNAME $PROJECTDIR $INDEX $HOSTNAME  
echo "###########################################################"
echo "Taking artifact and extactacting into Web Server Directory"
echo "###########################################################"
	rm -rf $PROJECTDIR
	echo "Hsadsadasfasfasdfasdf" 
	cd /opt
	unzip   $ZIPNAME.zip -d $PROJECTDIR  #given here static path can be changed later

echo "Giving  permission to artifact"
chmod -R 750 $CONFFILENAME
echo "successfully Deployed"



