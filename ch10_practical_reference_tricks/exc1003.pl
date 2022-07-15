#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

my @words = ("The Professor", "Skipper", "Mary-Ann", "Maryon", "Guillaume", "Theo");

sub dictionary_transform {
    my $word = shift;

    $word =~ tr/[A-Z]/[a-z]/;
    $word =~ tr/a-z//cd;

    $word;
};

my @ordered_words = map $_->[0],
    sort {$a->[1] cmp $b->[1]}
        map [$_, dictionary_transform($_)], @words;

foreach (@ordered_words) {
    print "$_\n";
}