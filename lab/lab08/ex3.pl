#!/usr/bin/perl

sub grab_lines{
	my ($n) = @_;
	my $lines = "";
	for ($i=0;$i<$n;$i++){
		$lines .= <>; #. is concatenating the strings.
	}
	
}