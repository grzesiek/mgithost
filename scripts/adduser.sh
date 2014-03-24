#!/bin/bash

if [ "$1" == "" ]; then
	echo "No username supplied !"
	exit 1
fi

if (id $1 &> /dev/null); then
	echo "Such user does not exist !";
	exit 1
fi;

USER=$1
export HISTIGNORE="*passwd*:*password*"

mkdir /home/users/accounts/$USER
chmod 751 /home/users/accounts/$USER
mkdir /home/users/accounts/$USER/home
mkdir /home/users/accounts/$USER/home/www
mkdir /home/users/accounts/$USER/sites

touch /home/users/accounts/$USER/home/www/.gitkeep
touch /home/users/accounts/$USER/sites/.gitkeep

adduser --home /home/users/accounts/$USER/home --no-create-home --shell /bin/bash --disabled-password $USER
chown $USER.$USER /home/users/accounts/$USER/home/www
adduser $1 sftp
PASS=`makepasswd --chars 12 --count 1`
echo "$USER:$PASS" | chpasswd

cd /home/users/accounts/$USER
git init --shared=false
git add .
git commit -am "Initial account commit for $USER"

echo -e "\n\nGenerated password: $PASS"
