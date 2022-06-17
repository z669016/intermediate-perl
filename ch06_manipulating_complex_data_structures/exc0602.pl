#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use JSON;

my $total_bytes;
my $store_name = "./ch06_manipulating_complex_data_structures/coconut.json";
my $data_file = "./ch05_references_and_scoping/coconut.dat";

{
    if (-e $store_name) {
        open my $json_fh, "<:utf8", $store_name;
        local $/;
        my $json_text = <$json_fh>;
        $total_bytes = decode_json($json_text);
    }
}

open STDIN, "<", $data_file;
while (<>) {
    next if /\A\s+#/;
    my ($source, $destination, $bytes) = split;
    $total_bytes->{$source}{$destination} += $bytes;
}

{
    open my $json_fh, '>:utf8', $store_name;
    print $json_fh to_json($total_bytes, { pretty => 1 });
}

for my $source (sort keys %{$total_bytes}) {
    print "$source\n";
    for my $dest (sort  keys %{ $total_bytes->{$source} }) {
        print "\t$dest $total_bytes->{$source}{$dest}\n";
    }
}