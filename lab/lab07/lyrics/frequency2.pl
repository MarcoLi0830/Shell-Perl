#!/usr/bin/perl -w

foreach $file(glob "lyrics/*"){
	my $artist = $file;
	$artist =~ s/.*\///;
	$artist =~ s/\.txt$//;
	$artist =~ s/_/ /g;
	open my $f, '<', $file or die "can not open $file: $!";
	while($line = <$f>){
		$line = lc $line;
		foreach $word ($line =~ /[a-z]+/g){
			$frequency{$artist}{$word}++;
			$n_words{$artist}++;
		}
	}
	close $f;
}

foreach $word(@ARGV){
	$word = lc $word;
	foreach $artist(sort keys %frequency){
		my $f = $frequency{$artist}{$word}||0;
		my $n = $n_words{$artist};
		printf "%4d/%6d = %.9f %s\n",$f,$n,$f/$n,$artist;
	}
}
