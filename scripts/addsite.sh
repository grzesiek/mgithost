#!/bin/bash

# Usage: ./addsite.sh username url

if [ "$2" == "" ]; then
	echo "Invalid parameters: ./addsite.sh username url (without www and http://)"
	exit 1
fi

if ! (id $1 &> /dev/null); then
        echo "Such user does not exist !";
        exit 1
fi;

USER=$1
URL=$2
IP="123.123.12.12"

echo "Creating Apache VirtualHost ..."
	VHOST="
	<VirtualHost $IP:80>\n\tServerName $URL\n
	\tServerAlias www.$URL\n\tDocumentRoot /home/users/accounts/$USER/home/www/$URL\n
	\tCustomLog /var/log/apache2/$URL.access.log combined\n\tErrorLog /var/log/apache2/$URL.error.log\n
	\tAssignUserID $USER $USER\n</VirtualHost>"
	
	echo -e $VHOST > /home/users/accounts/$USER/sites/$URL

echo "Creating website homedir ..."
	mkdir /home//users/accounts/$USER/home/www/$URL
	chown $USER.$USER /home//users/accounts/$USER/home/www/$URL

echo "Enabling website ..."
	ln -s /home/users/accounts/$USER/sites/$URL /etc/apache2/sites-enabled/$USER\_$URL

echo "Reloading Apache webserver ..."
	/etc/init.d/apache2 reload
