#!/bin/bash

for dir in `dir /home/users/accounts`; do

	cd /home/users/accounts/$dir

	if test -d .git; then

		if ! (git status | grep -q "nothing to commit"); then
			git add -A
			git commit -am "Periodical commit for $dir"
		fi
	fi
done
