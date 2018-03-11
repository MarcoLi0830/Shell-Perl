#!/usr/bin/perl -w


foreach $file(glob "lyrics/*.txt"){
	my $artist = $file;
	$artist =~ s/.*\///;
	$artist =~ s/\.txt$//;
	$artist =~ s/_/ /g;
	open my $f, '<',$file or die "can not open $file: $!";
	while($line = <$f>){
		$line = lc $line;
		my @words = split /[^a-z]/, $line;
		foreach $word(@words){
			$frequency{$artist}{$word}++;
			$n_words{$artist}++;
		}
	}
	close $f;
}

foreach $word(@words){
	foreach $artist(sort keys %frequency){
		my $f = $frequency{$aritst}{$word};
		my $n = $n_words{$artist};
		printf "%4d/%6d = %.9f %s\n", $f, $n, $f/$n, $artist;
	}
}
