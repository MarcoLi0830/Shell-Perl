#!/usr/bin/perl

@numbers = @ARGV;
@sorted_nums = sort {$a <=> $b} @numbers;
$median_index = @sorted_nums / 2;
$median_number = $sorted_nums[$median_index];
print "$median_number\n";
