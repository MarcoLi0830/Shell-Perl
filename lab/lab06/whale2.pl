#!/usr/bin/perl -w

die "Usage: $0 <whale species>\n" if @ARGV != 1;

$target_species = $ARGV[0];

$n_pods = 0;
$n_individuals = 0;

while($line = <STDIN>){
	if ($line =~ /(\d+)\s*(.+)$/){
		$count = $1;
		$species = $2;
		if ($species eq $target_species){
			$n_pods++;
			$n_individuals += $count;
		}
	}
}


