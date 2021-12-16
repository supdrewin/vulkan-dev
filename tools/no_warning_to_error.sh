#!/bin/bash

# -Werror prevent build of some components
# to make sure the changes not be override
# we have to catch it while building like:

# $1 - cmake build directory
# $2 - build completed mark

[[ "$1" && "$2" ]] &&
	while :; do
		[[ -e "$2" ]] && exit
		files=$(find "$1" -type f -name *.make)
		sed -i 's/-Werror=deprecated-copy//g' $files
		sed -i 's/-Werror//g' $files
		sleep 1
	done
