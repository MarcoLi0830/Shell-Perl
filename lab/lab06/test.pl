#!/usr/bin/perl

sub func{
print $_[0],"\n";
}

@course =("aa","bb","cc");
if("dd"~~@course)
{
	print "Match\n";
}
else
{
	print "miss\n";
}