#!/bin/sh

for file in *.htm
do
	tmp_file=$file'l'
	if test -e "$tmp_file"
	then
		echo "$tmp_file" exists
		exit 1
	fi
	mv  "$file" "$tmp_file"
done
