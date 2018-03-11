#!/usr/local/bin/perl -w
@d_arr=();
while($line = <STDIN>)
{
	@s = $line =~ /\d+/g;
	push(@d_arr,@s);
}

@d_arr = sort { $b <=> $a } @d_arr;

@result = ();
@same = ();
$num = -1;
$size = @d_arr;
while($size != 0){
	$num = 0;
	$num = shift(@d_arr);
	$flag = 1;
	#print "arr:@d_arr\n";
	if($num ~~ @same){
		#print "xxxxx\n";
			next;
		}	
	foreach $d(@d_arr){
		#print $num." ".$d."\n";
		if($d ~~ @same){
			next;
		}		
		elsif ($d == $num){
			$flag = 0;
			push(@same, $d);
		}elsif($num % $d == 0){
			$flag = 0;
			#unshift(@result, $num);
			last;
		}
	}
	if($flag == 1){
		#print "num: $num\n";
		unshift(@result, $num);
	}
	$size = @d_arr;
}

foreach $i(@result){
	if($i){
	print "$i ";
	}
	$i = '';
}
print "\n";
