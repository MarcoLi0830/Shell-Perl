#!/usr/bin/perl -w

open F,'<',$ARGV[0] or die "error!\n";
@lines = <F>;
@result = ();
foreach $line(@lines){
	$line =~ s/[aeiouAEIOU]//g;
	push @result,$line;
}
close F;

open D,'>',$ARGV[0] or die;
print D @result;
close D;

