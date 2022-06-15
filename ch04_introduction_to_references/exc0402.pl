#!/usr/bin/perl
use strict;
use warnings;

my @skipper   = qw(blue_shirt hat jacket preserver sunscreen);
my @professor = qw(sunscreen water_bottle slide_rule batteries radio);
my @gilligan  = qw(red_shirt hat lucky_socks water_bottle);

my %all = (
    Gilligan  => \@gilligan,
    Skipper   => \@skipper,
    Professor => \@professor,
);

check_items_for_all(\%all);

sub check_items_for_all {
    my $hash_ref = shift; # here you receive a reference to a hash

    foreach my $key (keys %$hash_ref) { # dereference the hash_ref to obtain keys
        check_required_items($key, $hash_ref->{$key}); # dereference the hash to obtain a value (which is again a ref)
    }
}

sub check_required_items { # unchanged, copied from the book
    my( $who, $items ) = @_;
    my %whos_items = map {$_, 1} @$items; #whos_items is a local hash created by mapping the de-referenced items list

    my @required = qw(preserver sunscreen water_bottle jacket);
    for my $item (@required) {
        unless ( $whos_items{$item} ) { # not found in list?
            print "$who is missing $item.\n";
        }
    }
}