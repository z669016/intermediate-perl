#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

open STDIN, "<", "./ch05_references_and_scoping/coconut.dat";

my %total_bytes;
my $total = '~total.bytes~';
while (<>) {
    my ($source, $destination, $bytes) = split;
    $total_bytes{$source}{$destination} += $bytes;
    $total_bytes{$source}{$total} += $bytes;
}

for my $source (sort { $total_bytes{$b}{$total} <=> $total_bytes{$a}{$total} } keys %total_bytes) {
    print "Total bytes from '$source' is $total_bytes{$source}{$total}\n";
    for my $dest (sort { $total_bytes{$source}{$b} <=> $total_bytes{$source}{$a} } keys %{ $total_bytes{$source} }) {
        print "$source => $dest: $total_bytes{$source}{$dest} bytes\n";
    }
    print "\n";
}