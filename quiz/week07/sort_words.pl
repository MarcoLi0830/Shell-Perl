#!/usr/bin/perl
$count = 0;
while($line = <STDIN>)
{
	chomp $line;
	$line =~ s/[ ]+/ /g;
	@words = split(" ",$line);
	@words = sort @words;
	$result[$count] = join(' ', @words);
	$count++;
}

for($i=0;$i<=$count-1;$i++)
{
	print "$result[$i]\n";
}