#!/usr/bin/perl 
$lines_to_print = 10;
if($#ARGV >= 0 && $ARGV[0] =~ /-[0-9]+/){
	$lines_to_print = shift @ARGV;
	$lines_to_print =~ s/-//;
}


foreach $f(@ARGV){
	open $fh,'<', $f;
	@lines = <$fh>;
	#print @lines,"\n";
	if($#lines+1 <= $lines_to_print)
	{
		if($#ARGV != 0)
		{
		   print "==> $f <==\n";
		}
		print @lines[0..$#lines];
		next;
		
	}
	else
	{
		$start = $#lines-$lines_to_print+1;
	}
	#print "$#lines $lines_to_print $start\n";
	if($#ARGV != 0)
	{
		print "==> $f <==\n";
	}
	print @lines[$start..$#lines];
	
}
