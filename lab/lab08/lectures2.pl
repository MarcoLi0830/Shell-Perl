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
			if(exists $HASH{$time})
			{
				next;
			}
			else
			{
				$HASH{$time}++;
			}
			$time =~ /.*>(.*)<\/td>/;
			$time = $1;
			if($time)
			{
				$time =~ s/\(\S+\)//g;	
				@times = split(',',$time);
				foreach $time(@times)
				{
					$time =~ s/:[03]0//g;
					$time =~ s/^ //g;
					$time =~ s/ $//g;
					$time =~ s/-//g;
					$time =~ s/  / /g;
					@segs = split(' ',$time);
					$segs[1] =~ s/^0//;
					$count = $segs[2]-$segs[1] - 1;
				#	print "$arg: $period $time\n";
					if($period eq 'S1')
					{
						$h1{$segs[1]}{$segs[0]}++;
					}else {
						$h2{$segs[1]}{$segs[0]}++;
					}
					
					print "$period $arg $segs[0] $segs[1]\n";
					for($i=1;$i<=$count;$i++){
						$t = $segs[1]+$i;
						if($period eq 'S1')
						{
							$h1{$t}{$segs[0]}++;
						}else {
							$h2{$t}{$segs[0]}++;
						}
						print "$period $arg $segs[0] $t\n";
					}
				}	
			}
			
		}
	}
	$line_no++;
}	
}

printf "%s           %s     %s     %s     %s     %s\n",'S2','Mon','Tue','Wed','Thu','Fri'; 
for($i=9;$i<=20;$i++)
{

	$Mon = $h2{$i}{'Mon'};
	$Tue = $h2{$i}{'Tue'};
	$Wed = $h2{$i}{'Wed'};
	$Thu = $h2{$i}{'Thu'};
	$Fri = $h2{$i}{'Fri'};
	if($i == 9)
	{
		printf "%s         %2i   %2i   %2i    %2i   %2i\n","0".$i.":00", $Mon,$Tue,$Wed,$Thu,$Fri;
	}
	else{
		printf "%s         %2i   %2i   %2i    %2i   %2i\n",$i.":00", $Mon,$Tue,$Wed,$Thu,$Fri;
	}
}
   
#$h{$time}{$day}