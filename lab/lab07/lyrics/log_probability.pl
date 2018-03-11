#!/usr/bin/perl
$w = $ARGV[0];
foreach $file(glob "lyrics/*.txt"){
	open $f, '<', $file;
	@lines = <$f>;
	$file =~ /.*\/(.*)/;
	$artist = $1;
	chomp $artist;
	$artist =~ s/\.txt$//g;
	$artist =~ s/[_]/ /g;
	foreach $line(@lines)
	{
	chomp $line;
	if($line eq "")
	{
		next;
	}
	$line = lc $line;
	$line =~ s/[^a-z]/ /g;
	$line =~ s/[0-9]+//g;
	$line =~ s/[ ]+/ /g;
	$line =~ s/^[ ]+//g;
	#print $line."\n";
	@temp = split(/[\W]+/,$line);
	@words= (@words, @temp);
	
	foreach $word(@temp)
	{
		$word = lc $word;
		if($wordsHash{$word})
		{
			$wordsHash{$word}++;
		}
		else
		{
			$wordsHash{$word}=1;
		}
	}
	
	}
	$size = @words;
	#printf $wordsHash{$w}/$#words."\n";
	printf "log((%d+1)/%6d) = %8.4f %s\n", $wordsHash{$w},$size,log(($wordsHash{$w}+1)/$size), $artist; 
	@words=();
	@temp = ();
	undef %wordsHash;
	
}


