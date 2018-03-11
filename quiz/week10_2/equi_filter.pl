#!/usr/bin/perl -w

sub is_equi_word{
	my ($word) = @_;
	my @letters = split //, lc $word;
	my %letter_count;
	foreach $letter(@letters){
		$letter_count{$letter}++;
	}
	my %count_value;
	foreach $count (values %letter_count){
		$count_value{$count}++;
	}
	return (keys %count_value) == 1;
}


while($line = <STDIN>){
	my @words = split /\s+/,$line;
	my @equi_words = grep {is_equi_word($_)} @words;
	print join(' ',@equi_words),"\n";
}
