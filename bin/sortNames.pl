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
    }
}
