#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use Storable;

my $total_bytes;
my $store_name = "./ch06_manipulating_complex_data_structures/coconut.store";
my $data_file = "./ch05_references_and_scoping/coconut.dat";

if (-e $store_name) {
    $total_bytes = retrieve $store_name;
}

open STDIN, "<", $data_file;
while (<>) {
    next if /\A\s+#/;
    my ($source, $destination, $bytes) = split;
    $total_bytes->{$source}{$destination} += $bytes;
}

store $total_bytes, $store_name;

for my $source (sort keys %{$total_bytes}) {
    print "$source\n";
    for my $dest (sort  keys %{ $total_bytes->{$source} }) {
        print "\t$dest $total_bytes->{$source}{$dest}\n";
    }
}