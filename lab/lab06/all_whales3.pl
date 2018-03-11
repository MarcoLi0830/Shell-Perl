#!/usr/bin/perl -w

while($line = <STDIN>){
	$line = lc $line;
	$line =~ s/\s+$//;
	$line =~ s/s?$//;
	$line =~ s/\s+/ /g;
	if($line =~ /(\d+)\s+(.*)$/){
		$count = $1;
		$species = $2
		$n_pods{$species}++;
		$n_individuals{$species} += $count;
	}
}

foreach $species(sort keys %n_individuals){
	print "$species observations: $n_pods{$species} pods, $n_individuals{$species} individuals\n";
}
