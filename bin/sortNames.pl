#!/usr/bin/perl -w
# FILE: sortNames.pl
#
# 

use strict;

my @lastNames = ();
my %firstNameForLastName = ();

while (<>) {
    if (/^\s*\"(\S+)\s+(\S+)\"\s*$/) {
	my $firstName = $1;
	my $lastName = $2;
	print "INFO: Found $firstName $lastName\n";
        $firstNameForLastName{$lastName} = $firstName;
	push(@lastNames, $lastName);
    } else {
	print "ERROR: Could not parse line: $_";
    }
}

my @sortedLastNames = sort(@lastNames);

foreach my $sortedLastName (@sortedLastNames) {
    print "$firstNameForLastName{$sortedLastName} $sortedLastName\n";
}
