#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

open STDIN, "<", "./ch05_references_and_scoping/coconut.dat";

my %total_bytes;
while (<>) {
    my ($source, $destination, $bytes) = split;
    $total_bytes{$source}{$destination} += $bytes;
}

for my $source (sort keys %total_bytes) {
    print "$source\n";
    for my $dest (sort  keys %{ $total_bytes{$source} }) {
        print "\t$dest $total_bytes{$source}{$dest}\n";
    }
}