#!/bin/sh
s="Small files: "
m="Medium-sized files: "
l="Large files: "

ls | ( while read name
do
	count=`wc -l $name | sed 's/[^0-9]//g'`
	
	if [ $count -lt 10 ]
	then
		#echo $name
		s=${s}" "${name}
		#echo $s
	elif [ $count -lt 100 ] 
	then
		#echo $name
		m=${m}" "${name}
		#echo $m
	else
		#echo $name
		l=${l}" "${name}
		#echo $l
	fi
done

echo $s
echo $m
echo $l
)