#!/bin/sh
f_char=`echo $1 | cut -c 1,1`
ADDR="http://www.handbook.unsw.edu.au/vbook2017/brCoursesByAtoZ.jsp?StudyLevel=Undergraduate&descr="${f_char}
content=""
for line in `wget -q -O- $ADDR | egrep $1`
do
	if echo $line | egrep "</A></TD>" >/dev/null 2>&1
	then
		content=${content}" $line \n"
	else
		content=${content}" $line"
	fi
done

ADDR="http://www.handbook.unsw.edu.au/vbook2017/brCoursesByAtoZ.jsp?StudyLevel=Postgraduate&descr="${f_char}
for line in `wget -q -O- $ADDR | egrep $1`
do
	if echo $line | egrep "</A></TD>" >/dev/null 2>&1
	then
		content=${content}" $line \n"
	else
		content=${content}" $line"
	fi
done

result=""

echo $content > temp_file
echo $content | (while read line
do
	result=${result}`echo $line | egrep -o "$1[0-9]*\.html.*" | sed "s/\.html\"\>/ /g" | sed "s/\<\/A\>\<\/TD\>//g" | sed "s/ *$//g"`"\n" 
done
echo $result|sort|uniq)




