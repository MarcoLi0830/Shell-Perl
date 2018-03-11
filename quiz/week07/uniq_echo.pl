#!/usr/bin/perl

foreach $word(@ARGV)
{
	if(exists $hash{$word})
	{
		next;
	}
	else
	{
		print "$word ";
		$hash{$word}=1;
	}
	
}
print "\n";