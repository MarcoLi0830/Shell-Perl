#!/usr/bin/perl -w

die "$0: number of arguments must be odd\n" if @ARGV % 2 != 1;

@sorted_arr = sort {$b <=> $a} @ARGV;
$median_index = @sorted_arr / 2;
print "$sorted_arr[$median_index]\n";
$result = int(@sorted_arr / 2);
print $result."\n";
