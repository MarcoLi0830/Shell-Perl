#!/usr/bin/perl

foreach $arg(@ARGV)
{
$url = "http://timetable.unsw.edu.au/current/".$arg.".html";

open $f, "wget -q -O- $url|";
@lines = <$f>;
$line_no = 0;
foreach $line(@lines)
{
	
	if($line =~ /.*>Lecture<.*/)
	{	$section = $lines[$line_no + 3];
		if($section =~ /.*WEB.*/)
		{
			
		}else{
			#print "hhhh\n";
			$period = $lines[$line_no + 1];
			$period =~ /.*(T[12]).*/;
			if($1 eq 'T1')
			{
				$period = 'S1';
			}else { $period = 'S2';}
			
			$time = $lines[$line_no + 6];
			#print "$time\n";
			if(exists $HASH{$arg}{$time})
			{
				$line_no++;
				next;
			}
			else
			{
				$HASH{$arg}{$time}++;
			}
			$time =~ /.*>(.*)<\/td>/;
			$time = $1;
			if($time =~ /\//)
			{	
				$line_no++;
				next;
			}		
			if($time)
			{print "$arg: $period $time\n";}
			else{}
		}
	}
	$line_no++;
}	
}
