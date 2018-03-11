#!/usr/bin/perl -w
$result = '';
sub isEqui{
	my %hash = ();
	my $value = 0;
	my $word = $_[0];
	@letters = split(//,$word);
	foreach $letter(@letters){
		$hash{$letter}++;
	}	
	
	@keys = keys %hash;
	foreach $key(@keys){
		if($value == 0){
			$value = $hash{$key};
			next;
		}
		if($value != $hash{$key}){
			return 0;
		}
	}	
	return 1;
	
}
while($line = <STDIN>){
	chomp $line;
	@words = split(/\s+/,$line);
	$match = 0;
	foreach $word(@words){
		$tmp = $word;
		if(isEqui(lc($tmp))){
			$result = $result.$word." ";
			$match = 1;	
		}		
	}
	if($match){
	$result =~ s/\s$//;
	$result = $result."\n";
	}else{
	$result = $result."\n";
	}
}

print $result;

