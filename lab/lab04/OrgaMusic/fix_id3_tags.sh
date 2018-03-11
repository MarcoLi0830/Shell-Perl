#!/bin/bash
for file in "$@"
do
	if test -d "$file"
	then
		#echo "$file"
		path=`echo $file | cut -d'/' -f2`
		ab=$path
		year=`echo $path | cut -d',' -f2| sed 's/ //g'`
		ls -1 "$file"|while read line
		do
			title=`echo $line| cut -d' - ' -f2| sed 's/^ //'|sed 's/ $//'`
			artist=`echo $line| cut -d'-' -f3|sed 's/^ //'|sed 's/.mp3//'`
			track=`echo $line|cut -d' ' -f1`
		      # echo $line
			#line=`echo "$line"|sed 's/ /\\ /g'`
			#echo -e "$line"
			#echo "$line" |  id3 -a $artist 
			addr="$file""/""$line"
			#$echo "$ab"
		        id3 -a "$artist" "$addr" > /dev/null 2>&1
			id3 -t "$title" "$addr" > /dev/null 2>&1
			id3 -T "$track" "$addr" > /dev/null 2>&1
			id3 -A "$ab" "$addr" > /dev/null 2>&1
			id3 -y "$year" "$addr" > /dev/null 2>&1
		done 
	fi
done
