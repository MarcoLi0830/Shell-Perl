#!/bin/bash
for file in "$@"
do
	display $file
	echo -n 'Address to e-mail this image to? '
	read mailAddr
	echo -n 'Message to accompany image? '
	read msg
	echo $msg | mutt -s $file -e 'set copy=no' -a $file -- $mailAddr
	echo $file sent to $mailAddr
done

