#!/bin/bash

# `pwd` should be where the swiftshader repos
# -Werror prevent build while using clang++ :(
# and the flags autogen by cmake while building

while :; do
	sed -i 's/-Werror//g' $(find build -type f -name *.make)
	echo -n 1
	sleep 1
done
