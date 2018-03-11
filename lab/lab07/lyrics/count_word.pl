#!/usr/bin/perl
@words = ();
$w = $ARGV[0];
while($line = <STDIN>)
{
	@temp = ();
	
	chomp $line;
	if($line eq "")
	{
		next;
	}
	$line = lc $line;
	$line =~ s/[^a-z]+/ /g;
	$line =~ s/[0-9]+//g;
	$line =~ s/[ ]+/ /g;
	$line =~ s/^[ ]+//g;
	#print $line."\n";
	@temp = split(/ /,$line);
	foreach $word(@temp)
	{
		next if ($word eq "" || $word eq " ");
		$word = lc $word;
		if(exists $wordsHash{$word})
		{
			$wordsHash{$word}++;
		}
		else
		{
			$wordsHash{$word}=1;
		}
	}
}

if($wordsHash{$w})
{
	print "death occurred $wordsHash{$w} times\n";
}else{
	print "death occurred 0 times\n";
}



