#!/usr/bin/perl
$number = $ARGV[0];
while($line = <STDIN>)
{

	#print "$line\n";
	chomp $line;
	if($lines_all{$line})
	{
		$lines_all{$line}++;
		if ($lines_all{$line} == $ARGV[0])
		{
			print "Snap: $line\n";
			last;
		}
	}
	else
	{
		$lines_all{$line} = 1;
	}
}
