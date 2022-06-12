#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

if (@ARGV == 0) {
    @ARGV = glob "*/**";
}

my @big_files = grep {-f $_ and (stat($_))[7] < 1000} @ARGV;
print map ' ' x 4 . $_ . "\n", @big_files;

__END__
