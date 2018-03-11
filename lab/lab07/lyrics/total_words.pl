#!/usr/bin/perl
@words = ();

while($line = <>)
{
	@temp = ();
	chomp $line;
	if($line eq "")
	{
		next;
	}
	#$line =~ s/[^a-zA-Z]+/ /g;
	$line = lc $line;
	$line =~ s/[^a-z]+/ /g;
	$line =~ s/[0-9]+//g;
	$line =~ s/[ ]+/ /g;
	$line =~ s/^[ ]+//g;
	$line =~ s/[ ]+$//g;
	#print $line."\n";
	@temp = split(/[\W]+/,$line);
	#print "@temp\n";
	@words = (@words, @temp);
	#print "@words\n";
}
$size = @words;
print "$size words\n";
