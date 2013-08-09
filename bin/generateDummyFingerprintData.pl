#!/usr/bin/perl -w
# generateummyFingerprintData

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

my $INFO = 1;

sub main {

    my ($argc, @argv) = @_;

    if ($argc != 2) {
        &usage($argv[0]);
        return -1;
    }

    my $inputSeed = $argv[1];

    srand($inputSeed);
    my $firstRandom = int(rand(0xffffffff+1));
    my $firstRandomInBinary = sprintf("%032b", $firstRandom);
    my $firstRandomInHex = sprintf("%08x", $firstRandom);
    $INFO && print STDOUT qq/INFO: Generate random fingerprint scannner output data based on seed=$inputSeed.\n/;
    $INFO && print STDOUT qq/INFO: First random = $firstRandom (0x$firstRandomInHex, $firstRandomInBinary)\n/;

    generateDummyFingerprintData(12, 24);
}

sub generateDummyFingerprintData {

    my ($sensorWidth, $sensorHeight) = @_;

    $INFO && print STDOUT qq/INFO: generateDummyFingerprintData\n/;

    for (my $i=0; $i<$sensorHeight; $i++) {
	my $lineToPrint = "";
	for (my $j=0; $j<$sensorWidth; $j++) {
	    my $randHex = sprintf("%08x", int(rand(0xffffffff+1)));
	    $lineToPrint .= "0x".$randHex.",";
	    if ($j == $sensorWidth-1) {
		chop($lineToPrint);
            }
	}
	print STDOUT $lineToPrint."\n";
    }

}



