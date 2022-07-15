#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use Benchmark;

my $files_sorted_simple = sub {
    chdir; # the default is our home directory
    sort {-s $a <=> -s $b} glob '*';
};

my $files_sorted_schwartzian_transform = sub {
    chdir; # the default is our home directory

    my @sorted =
        map $_->[0],
        sort { $a->[1] <=> $b->[1] }
            map [ $_, -s $_ ],
                glob '*';
};

Benchmark::timethese(-2, {
    Simple   => $files_sorted_simple,
    Schwartz => $files_sorted_schwartzian_transform,
});

