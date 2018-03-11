#!/bin/sh

t=1

if test $# != 2 
then
	echo "Usage: ./echon.sh <number of lines> <string>"
elif echo $1 | egrep '[^0-9]+$' > /dev/null 2>&1;
then
	echo "./echon.sh: argument 1 must be a non-negative integer"
elif test $1 -lt 0 > /dev/null 2>&1
then
	echo "./echon.sh: argument 1 must be a non-negative integer"
else
	while [ $t -le $1 ]
	do
		echo $2
		t=`expr $t + 1`
	done
fi