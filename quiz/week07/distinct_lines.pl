#!/usr/bin/perl
$num = $ARGV[0];
$count = 0;
$flag = 0;
$dis_count=0;
while($line = <STDIN>)
{
	chomp $line;
	$count++;
	if(exists $hash{$line})
	{
		#$hash{$line}++;
		next;
	}
	else
	{
		$dis_count++;
		if($dis_count == $num)
		{
			$flag = 1;
			last;
		}
		$hash{$line} = 1;
	}
}

if($flag)
{
	print "$num distinct lines seen after $count lines read.\n";
}
else
{
	print "End of input reached after $count lines read - $num different lines not seen.\n";
}
