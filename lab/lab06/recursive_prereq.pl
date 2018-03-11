#!/usr/bin/perl
#use feature 'state';
#state @course_set;


sub recur_pre{

#print "current course: $_[0]  course_set: @course_set\n";
my $url_post= 'www.handbook.unsw.edu.au/postgraduate/courses/current/'.$_[0].'.html';
my $url_under= 'www.handbook.unsw.edu.au/undergraduate/courses/current/'.$_[0].'.html';
#open $f, '-|',"wget -q -O- $urSSSl";
open $f, "wget -q -O- $url_under|";
@lines = <$f>;
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
			my @course = split / /, $line;
			foreach $c(@course)
			{
				if($c~~@course_set)
				{
				
				}
				else
				{
					push(@course_set, $c);
					recur_pre($c);
				}
			}
			
		#	$size = @course;
		#	print $course[0],"\n";
		}
	}		
}
#print "out $_[0] \n";
#print "out : $url_post\n";
open $f, "wget -q -O- $url_post|";
@lines = <$f>;
#print "$url_post \n";
#print "$#lines \n";
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
			my @course_post = split / /, $line;
			foreach $c(@course_post)
			{
				if($c~~@course_set)
				{
				
				}
				else
				{
				push(@course_set, $c);
				recur_pre($c);
				}
			}
			#$size = @course_post;
			#print $course[0],"\n";
		}
	}		
}
 # print "final!\n";
}
#print "$#ARGV \n";
if($#ARGV == 0)
{recur_pre($ARGV[0]);}
else
{
recur_pre($ARGV[1]);
}
@course_set = sort @course_set;
foreach $c(@course_set)
{
	if($c =~ /[A-Z]{4}[0-9]{4}/)
	{
	print "$c\n";
	}
}
