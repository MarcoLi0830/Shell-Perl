#!/usr/bin/perl
use List::MoreUtils qw{ any };
$max = 0;
sub preProcess{
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
	$line =~ s/[^a-z]+/ /g;
	$line =~ s/[0-9]+//g;
	$line =~ s/[ ]+/ /g;
	$line =~ s/^[ ]+//g;
	#print $line."\n";
	@temp = split(/[\W]+/,$line);
	@words= (@words, @temp);
	
	foreach $word(@temp)
	{
		$word = lc $word;
		if($hash{$artist}{$word})
		{
			$hash{$artist}{$word}++;
		}
		else
		{
			$hash{$artist}{$word}=1;
		}
	}
	}
	$size = @words;
	$wordCount{$artist} = $size;
	@words = ();
	@temp = ();
	#print "$artist finnished!\n";
}
}

sub logProb{
my $w = $_[0];
#print "$w";
foreach $file(glob "lyrics/*.txt"){
		$file =~ /.*\/(.*)/;
		$artist = $1;
		chomp $artist;
		$artist =~ s/\.txt$//g;
		$artist =~ s/[_]/ /g;
		if(exists $resultHash{$artist})
		{
			$resultHash{$artist} += log(($hash{$artist}{$w}+1)/$wordCount{$artist});
		}
		else
		{
			$resultHash{$artist} = log(($hash{$artist}{$w}+1)/$wordCount{$artist});
		}
	}
	

}

preProcess();

if(any {$_ eq '-d'} @ARGV)
{
	shift @ARGV;
	$debug = 1;
}
else
{
	$debug = 0;
}

foreach $arg(@ARGV)
{
	chomp $arg;
	open $f, '<', $arg;
	@lines = <$f>;
	
	foreach $line(@lines)
	{
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
	@temp = split(/[\W]+/,$line);
	@words= (@words, @temp);
	#print "@words sss\n";
	foreach $word(@temp)
	{
		$word = lc $word;
		if($songHash{$word})
		{
			$songHash{$word}++;
		}
		else
		{
			$songHash{$word}=1;
		}
	}
	
	}
	
	@wordSet = keys %songHash;
	foreach $word(@words)
	{
		#print "$word\n";
		logProb($word,$arg);
	}

	@artistSet = keys %hash;
	$max = -1000;
	
	foreach $artist(sort {$resultHash{$b}<=>$resultHash{$a}} keys %resultHash)
	{
	if($debug)
	{
		print "$arg: log_probability of $resultHash{$artist} for $a\n";
	}	
		if($max < $resultHash{$artist})
		{
			$max = $resultHash{$artist};
			$aName = $artist;
		}
	}
	printf "%s most resembles the work of %s (log-probability = %.1f)\n",$arg, $aName, $max; 
	#print "$arg most resembles the work of $aName (log-probability = $max)\n";
	
	@words = ();
	%resultHash = ();
	%songHash = ();
#	@key = keys %hash;
#	print "@key\n";
#	undef %hash;
}


