#!/usr/bin/perl -w

die "Usage: $0: <file>\n" if @ARGV != 1;
$filename = $ARGV[0];

open OLD,'<',$filename or die;
while($line = <OLD>){
	$line =~ s/[aeiou]//ig;
	push @lines, $line;
}
close OLD;

open NEW,'>',$filename or die;
print NEW, @lines;
close NEW;

