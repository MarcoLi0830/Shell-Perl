#!/usr/bin/perl

@whaleArr = ();
%whaleHash =();

for $line (<STDIN>){
	$line =~ /(\d+) (\D*)/;
	$num = $1; chomp ($num);
	$name = $2;$name = lc $name; chomp ($name); 
	$name =~ s/^[ ]*//g;
	$name =~ s/[ ][ ]*/ /g;
	$name =~ s/ $//g;
	if($name =~ /s$/)
	{
		#print "$name\n";
		chop($name);
		#print "$name\n";
	}
	if(!exists($whaleHash{$name}))
	{
		$whaleHash{$name} = [1,$num];
		push(@whaleArr, $name);
	}
	else
	{
		@temp =($whaleHash{$name}[0], $whaleHash{$name}[1]);
		$temp[0]++;
		$temp[1]=$temp[1]+$num;
		$whaleHash{$name} = [$temp[0],$temp[1]];
	}
}

@whaleArr = sort(@whaleArr);

foreach $name(@whaleArr)
{
	print "$name observations: $whaleHash{$name}[0] pods, $whaleHash{$name}[1] individuals\n";
}
