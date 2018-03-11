#!/usr/bin/perl -w

$dis = $ARGV[0];
$read = 0;
while($line = <STDIN>){
	$read++;
	$seen{$line}++;
	my @keys = keys %seen;;
	if(@keys >= $dis){
		print "$dis distinct lines seen after $read lines read.\n";
		exit 0;
	}
}

print "End of input reached after $read lines read - $dis different lines not seen.\n";
