#!/bin/sh

if test $# != 2
then
	echo "Usage: $0 <number fo lines> <string>"
	exit 1
fi

if test "$1" -ge 0 2>/dev/null
then
	
else
	echo "$0: argument 1 must be a non-negative integer"
	exit 1
fi

number_of_lines=$1
text=$2
line_count=0
while test $line_count -lt $number_of_lines
do
	echo $text
	line_count=$(($line_count+1))
done
exit
