#!/bin/bash


for param in "$@"
do
	cat $param | while read line
	do
		if echo $line | egrep "#include \"" > /dev/null 2>&1
		then
			file=`echo $line | cut -d' ' -f2 | sed "s/\"//g"`
			if ! test -e "$file"
			then
				echo "$file included into $param does not exist"
			fi
			
		fi
	done
done
