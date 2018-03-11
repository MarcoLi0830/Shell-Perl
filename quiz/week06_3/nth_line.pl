#!/usr/bin/perl -w

open F, '<',$ARGV[1];
@lines = <F>;
if($ARGV[0]-1 <= $#lines and $ARGV[0]-1>=0){
print "$lines[$ARGV[0]-1]";
}
