#!/usr/bin/perl

$count=0;
while($line = <>)
{
	chomp $line;
	$line =~ s/[0-9]+//g;
#	$line =~ s/[ ]+/ /g;
	$line_all[$count]=$line;
	$count++;
}

foreach $line(@line_all)
{
	print "$line \n";
}
