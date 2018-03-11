#!/bin/bash

for filename in `ls .`
do
	tmpName=$filename"l"
	if test -e "$tmpName"
	then
		echo "$tmpName" exists
		exit 1
	else
		if echo $filename | egrep ".htm$" >/dev/null 2>&1
		then
			mv "$filename" "${filename}l"
		fi
	fi
done
