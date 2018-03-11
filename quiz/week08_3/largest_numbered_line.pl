#!/usr/bin/perl -w

while($line = <STDIN>){
	my @line_numbers = $line =~ /(\-?\d*(?:\.\d+)?)/g;
	my $largest_number = -10000000000;
	foreach $word(@line_numbers){
		print "$word\n";
		$word =~ s/^ *//g;
		$word =~ s/ *$//g;
		if($word !~ /\d+/){
			next;
		}
		if($word > $largest_number){
			$largest_number = $word;
		}
	}
	push @numbers, $largest_number;
	push @lines,$line;
}

if(@numbers){
	my $lar = (sort {$b <=> $a} @numbers)[0];
	foreach $i (0..$#numbers){
		if($numbers[$i] == $lar){
			print $lines[$i];
		}
	}
}

