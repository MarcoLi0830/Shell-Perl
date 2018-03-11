#!/usr/bin/perl

@whaleArr = ();
%whaleHash =();

for $line (<STDIN>){
	$line =~ /(\d+) (\D*)/;
	$num = $1; chomp ($num);
	$name = $2; chomp ($name); 
	if($line =~ /s$/)
	{
		chop($name);
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
if(exists $whaleHash{$ARGV[0]})
{
	print "$ARGV[0] observations: $whaleHash{$ARGV[0]}[0] pods, $whaleHash{$ARGV[0]}[1] individuals\n";
}
else
{
	print "$ARGV[0] observations: 0 pods, 0 individuals\n";
}


