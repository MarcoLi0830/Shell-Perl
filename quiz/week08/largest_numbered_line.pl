#!/usr/bin/perl

$max = -10000;
@result = ();
while($line = <STDIN>)
{
	@a = $line =~ /[-]?[0-9.]*[0-9.]?[0-9]+/g;
	$size = @a;
	my $m = (sort { $b <=> $a } @a)[0];
	#print "$m size: $size\n";
	if($size == 0)
	{
	#   print "$size\n";
	}
	else{
	#	print "max: $max, m: $m \n";
		if($max < $m)
		{	$max = $m;
			@result = ();
			push(@result, $line);
		}
		elsif($max == $m){
			push(@result, $line);
		}
	}

}

foreach $line(@result)
{
	print "$line";
}
