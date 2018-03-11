#!/bin/usr/perl

sub include_file(){
	my ($file_name) = @_;
	open my $f, "<", $file_name;
	while($line = <$f>){
		if ($line =~ /^#include "(.*?)"/){
			include_file($1);
		} else{
			print $line;
		}
	} 
}

