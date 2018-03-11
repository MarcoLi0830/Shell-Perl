#!/usr/bin/perl

if($#ARGV!=1)
{
	exit;
}

open $f, '<', $ARGV[1];
@lines =<$f>;
#print $#lines;
if($ARGV[0] <= $#lines+1)
{
	if($ARGV[0]-1 >= 0)
	{
 	   print "$lines[$ARGV[0]-1]";
	}
}
#foreach $line(@lines)
#{
#	chomp $line;
	#print "$line \n";
#}
