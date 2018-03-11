#!/usr/bin/perl

$url_post= 'www.handbook.unsw.edu.au/postgraduate/courses/current/'.$ARGV[0].'.html';
$url_under= 'www.handbook.unsw.edu.au/undergraduate/courses/current/'.$ARGV[0].'.html';
#open $f, '-|',"wget -q -O- $urSSSl";
open $f, "wget -q -O- $url_under $url_post|";
@lines = <$f>;
@result_set;

if($#lines != -1)
{
	foreach $line(@lines)
	{
		if($line =~ /.*Prerequisite[s]?: ([\(\)\[\]\w\d\s,]+)[.]?<\/p>/)
		{	#print "$line \n";
			$line = $1;
			#print "$line \n";
			$line =~ /([A-Z]{4}[0-9]{4} [\(\)\[\]\w\d\s,]*)/;
			$line = $1;
			#print $line,"\n";
			$line =~ s/[orand]//g;
			#print $line,"\n";
			$line =~ s/[\s]+/ /g;
			$line =~ s/[\]\[,\(\)]//g;
			#print $line,"\n";
			@course = split / /, $line;
			my %hash;
			$hash{$_}=0 for (@course);
			@course = keys (%hash);
			foreach $c(@course)
			{
				push(@result_set,$c);
			}
		#	print $course[0],"\n";
		}
	}		
}

@result_set = sort @result_set;

foreach $c(@result_set)
{
	if($c =~ /[A-Z]{4}[0-9]{4}/)
	{
		print "$c \n";
	}
}


