#!/bin/sh
start=$1
end=$2
filename=$3

touch $3
while [ $start -le $end ]
do
	echo $start >> $filename
	start=$((start + 1))
done
