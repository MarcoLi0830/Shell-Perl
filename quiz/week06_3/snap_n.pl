#!/usr/bin/perl -w

$time = $ARGV[0];

while($line=<STDIN>){
	$t{$line}++;
	if($t{$line} != $time){
		
	}else{
		print "Snap: $line";
		last;
	}
}
