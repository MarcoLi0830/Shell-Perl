#!/usr/bin/perl  -w

@arr =();
while($line=<STDIN>)
{
	chomp $line;
	push(@arr, $line);
}
$flag = 1;
@product = ();
for($i = 0; $i < 5; $i=$i+1)
{
	$flag = 1;
	while($flag)
	{
		$num = int(rand(5));
		#print $num,"\n";
		foreach(@product)
		{
			if($_ == $num)
			{
				$flag = 0;
				last;
			}
		}
	#	print "$flag\n";
		if($flag==1)
		{
			push(@product, $num);
			$flag = 0;
		}
		else
		{
			$flag = 1;
		}
	#	print "pro: ",@product,"\n";
	}
}

for($i = 0; $i<5; $i = $i + 1)
{
	print $arr[$product[$i]],"\n";
}