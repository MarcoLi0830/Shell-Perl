#!/usr/bin/perl

$frequency_sorted = 0;
if($ARGV[0] eq '-f'){
	$frequency_sorted = 1;
	shift @ARGV;
}

foreach $url(@ARGV)
{
	# open $f, '-|', 'wget -q -O- $url';
	$source_code = `wget -q -O- $url`; # one big line
	$source_code = tr/A-Z/a-z/; #convert  to lowercase
	
	#<!-- <a not a actual tag> -->
	$source_code =~ s/<!--.*?-->//g; # note *?
	
	@tags = $source_code =~ /<(\s*(\w+).*?>/g;
	foreach $tag (@tags){
		$tag_count{$tag}++;
	}
	
	foreach $key(sort {$tag_count{$a} <==> $tag_count{$b}} keys %tag_count){
		print "$key $tag_count{$key}\n";
	}
	
	#$tag_count{$b} <==> $tag_count{$a}  decreasing order

}