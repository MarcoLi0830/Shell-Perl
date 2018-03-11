#!/bin/sh

for file in "$@"
do
	echo $file
	Tdate=`ls -l $file | cut -d' ' -f6-8`
	echo $Tdate
	convert -gravity north -pointsize 36 -draw "text 0,10 '$Tdate'" $file $file
done
