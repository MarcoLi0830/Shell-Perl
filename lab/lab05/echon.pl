#!/usr/local/bin/perl -w

if($#ARGV == 1){
	if($ARGV[0]	=~ /\D+/)
	{
		print "./echon.pl: argument 1 must be a non-negative integer\n";
	}
	else
	{
		$count = 1;
		while($count <= $ARGV[0])
		{
			print $ARGV[1],"\n";
			$count++;
		}
	}
}
else{
	print "Usage: ./echon.pl <number of lines> <string>\n";
}
