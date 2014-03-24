#!/bin/bash

if [ "$1" == "" ]; then
	echo "No username supplied !"
	exit 1
fi

USER=$1

if ! (id $1 &> /dev/null); then
        echo "Such user does not exist !";
        exit 1
fi;


export HISTIGNORE="*passwd*:*password*"

PASS=`makepasswd --chars 12 --count 1`
echo "$USER:$PASS" | chpasswd

echo -e "Changing password for $USER\n\nNew password: $PASS"
