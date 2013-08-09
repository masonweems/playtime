#!/usr/bin/perl -w
# FILE: sortNames.pl
#
# 

use strict;

my @lastNames = ();
my %firstNameForLastName = ();
my $DEBUG = 0;

while (<>) {

    if (/^\s*\"(\S+)\s+(\S+)\"\s*$/) {
	my $firstName = $1;
	my $lastName = $2;
	$DEBUG && print "DEBUG: Found $firstName $lastName\n";
        $firstNameForLastName{$lastName} = $firstName;
	push(@lastNames, $lastName);

    } else {
	print "ERROR: Could not parse line: $_";
    }
}

my @sortedLastNames = sort {lc $a cmp lc $b} @lastNames;

foreach my $sortedLastName (@sortedLastNames) {
    print "$firstNameForLastName{$sortedLastName} $sortedLastName\n";
}
