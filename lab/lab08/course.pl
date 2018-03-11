#!/usr/bin/perl
$url = "http://timetable.unsw.edu.au/2017/".$ARGV[0]."KENS.html";
open $f, "wget -q -O- $url|";
@lines = <$f>;
foreach $line(@lines)
{
	if($line =~ />([A-Z]{4}[0-9]{4}).*/)
	{
		print "$1\n";
	}
}
