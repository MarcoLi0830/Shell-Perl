#!/usr/bin/perl

open $f, '<',$ARGV[0];
@lines = <$f>;
$size = @lines;
$mid = int($size / 2);
#print "mid: $mid\n";
if($size % 2 == 0)
{
	$mid--;
	print "$lines[$mid]";
	$mid++;
	print "$lines[$mid]";
}
else
{
	print "$lines[$mid]";
}