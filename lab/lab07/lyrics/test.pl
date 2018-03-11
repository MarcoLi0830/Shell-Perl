#!/usr/bin/perl

$hash{'a'}{'h1'}=-10;
$hash{'a'}{'h2'}=-10;
$hash{'a'}{'h3'}=-10;
$hash{'b'}{'h1'}=-10;
$hash{'b'}{'h2'}=-10;
$hash{'b'}{'h3'}=-10;

@value = keys %hash;
print "@value\n";