#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

sub files_sorted_simple {
    chdir; # the default is our home directory
    sort {-s $a <=> -s $b} glob '*';
}

sub files_sorted_schwartzian_transform {
    chdir; # the default is our home directory

    my @sorted =
        map $_->[0],
        sort { $a->[1] <=> $b->[1] }
            map [ $_, -s $_ ],
                glob '*';

    foreach (@sorted) {
        print "$_\n";
    }
}

foreach (files_sorted_schwartzian_transform) {
    print "$_\n";
}
