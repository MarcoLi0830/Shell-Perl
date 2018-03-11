#!/bin/bash

for file in ./*
do
	if test -f "$file"
	then
		if echo "$file" | egrep ".*.jpg$" >/dev/null 2>&1
		then
			filename=`echo "$file" | sed "s/\.\///g"`
			tmpName=`echo $filename | cut -d'.' -f1`
			tmpName=$tmpName".png"
			if test -e "$tmpName"
			then
				echo "$tmpName" already exists
			else
				convert "$filename" "$tmpName"
				rm "$filename"
			fi
		fi
	fi	
done
