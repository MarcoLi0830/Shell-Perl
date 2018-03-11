#!/usr/bin/perl -w

open F,'<',$ARGV[0] or  die "Cannot open the file!";
@lines = <F>;

$size = @lines;
if ($size == 0){
exit 0;
}
if($size % 2 == 0){	
	print $lines[$size/2-1];
	print $lines[$size/2];
	
} else {
	print $lines[$size/2];
}
