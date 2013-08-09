#!/usr/bin/perl -w
# generateDummyFingerprintData

use strict;

sub usage {
    my ($executable) = @_;
    print STDERR "USAGE: $executable <integer seed>\n";
}

# Just doing this to mimic C for fun

unshift(@ARGV, $0); # add executable to beginning of array to match C
my $argc = @ARGV;   # get length of array
exit(&main($argc, @ARGV));

###############################
# main
###############################

sub main {

    my ($argc, @argv) = @_;

    if ($argc != 2) {
        &usage($argv[0]);
        return -1;
    }

    my $inputSeed = $argv[1];

    srand($inputSeed);
    my $firstRandom = rand();
    print STDOUT  qq/INFO: Generate random fingerprint scannner output data based on seed=$inputSeed. First random = $firstRandom\n/;

}



