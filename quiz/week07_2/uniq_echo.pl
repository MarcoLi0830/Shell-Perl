#!/usr/bin/perl -w

foreach $word(@ARGV){
	if(not exists($seen{$word})){
		$seen{$word}++;
		print $word.' ';
	}
}
print "\n";
