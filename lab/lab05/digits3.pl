#!/usr/bin/perl -w

while($line = <STDIN>){
	$line =~ s/[0-4]/</g;
	$line =~ s/[5-9]/>/g;
	print $line;
}

