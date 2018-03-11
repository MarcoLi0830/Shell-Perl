#!/usr/bin/perl
use List::MoreUtils qw{ any };
if(any {$_ eq '-d'} @ARGV)
{
	shift @ARGV;
	$detail = 1;
}
else
{
	$detail = 0;
}
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
			if($time)
			{
				if($detail)
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
					if(exists $hash2{$period.$arg}{$segs[0].$segs[1]})
					{
						next;
					}
					else{
						$hash2{$period.$arg}{$segs[0].$segs[1]}++;
					    }
					$count = $segs[2]-$segs[1] - 1;
				#	print "$arg: $period $time\n";
					if($segs[1] eq "09")
					{$segs[1] = "9";}
					print "$period $arg $segs[0] $segs[1]\n";
					
					for($i=1;$i<=$count;$i++){
						$t = $segs[1]+$i;
						if(exists $hash2{$period.$arg}{$segs[0].$t})
						{
							next;
						}
						else{
							$hash2{$period.$arg}{$segs[0].$r}++;
					  	    }
						print "$period $arg $segs[0] $t\n";
					}
				}
			   }
				else{
					print "$arg: $period $time\n"
				    }	
			}
			
		}
	}
	$line_no++;
}	
}
