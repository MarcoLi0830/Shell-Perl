#!/usr/bin/perl

$filename = $ARGV[0];
open $f, '<', $filename;
@lines = <$f>;

sub translate_expression {
	 $expr = $_[0];
	 my @comp = split(' ',$expr);
	 my $result = '';
	 foreach my $op(@comp)
	 {
	 	
	 #	print "op: $op\n";
	 	if($op =~ /[\d\w]/)  #operand
	 	{
	 		if($op =~ /^[-\d]+$/)
	 		{
	 			$result = $result."$op ";
	 		}
	 		else{
	 			$result = $result."\$$op ";
	 		}
	 	}
	 	else{  #operator
	 		$result = $result."$op ";
	 	}
	 }
	 $result =~ s/\s+$//;
	 return $result;
	 
}
foreach $line(@lines)
{
	if($line =~ /^#!(.*)/){
		print "#!/usr/bin/perl -w\n";
	}
	elsif($line =~/^#(.*)/){
		print "$line\n";
	}
	elsif($line =~/^\s*$/)
	{
		print "\n";
	}
	elsif($line =~ /(.*)while \(\((.*)\)\)/){
		#print "expr: $2\n";
		$expr = translate_expression($2);
		print "$1while ($expr)";
	}
	elsif($line =~/(\s*)do$/){
		print "{\n";
	}
	elsif($line =~/(\s*)done$/)
	{
		print "$1}\n";
	}	
	elsif($line =~ /(.*)echo (.*)/)
	{
		print "$1print \"$2\\n\";\n";
	}
	elsif($line =~ /(.*)(\b.+\b)=(.*)/){
		$leftPart = $1;
		$operand1 = $2;
		if($3 =~ /\$\(\((.*)\)\)/){
		#	print "\$1: $1  $operand1\n";
			$exp = translate_expression($1);
			print "$leftPart\$$operand1=$exp;\n";
		}
		else{
			print "$leftPart\$$operand1=$3;\n";
		}
		
	}
	elsif($line =~ /(.*)if \(\((.*)\)\)/)
	{
		$exp = translate_expression($2);
		
		print "$1\if($exp)\n";
		
	}
	elsif($line =~ /(.*)then/){
		print "$1\{\n";
	}
	elsif($line =~/(.*)else/){
		print "$1\} else \{\n";
	}
	elsif($line =~ /(.*)fi/){
		print "$1\}\n";
	}
	
}


