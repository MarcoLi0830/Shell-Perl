#!/usr/bin/perl

$function = $ARGV[0];
foreach $file(glob "*.c"){
	open $f,'<', $file;
	while($line = <$f>){
		$line =~ s/".*?"//;
		$line =~ s/\/\/.*//g;
		if ($line =~ /\b$function/){ #\b indicates a start of a word
			if($line =~ /{/){
				#definition
				print "$file:$. function $function defined.\n";
			}
			else if($line =~/^\S/){
				#usage
				  print "$file:$. function $function used.\n";
			} else{
				# declaration
				print "$file:$. function $function declared.\n";
			}
		}
	}
}

# $. 