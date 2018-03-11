#!/usr/bin/perl -w

while($line = <STDIN>){
	my @words = split /\s+/, $line;
	my @sorted_words = sort @words;
	$line = join(' ',@sorted_words);
	print $line."\n";
}
