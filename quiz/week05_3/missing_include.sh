#!/bin/sh

for file in "$@"
do
	for include_file in `egrep '^#include *"' "$file" | sed 's/" *$//;s/^.*"//'`
	do
		if test ! -e "$include_file"
		then
			echo "$include_file included into $file does not exist"
		fi
	done
done
