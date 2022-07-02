#!/usr/bin/perl
use utf8;
use strict;
use warnings;

use v5.12;

my %patterns = (
    Gilligan   => qr/(?:Wiley )?Gilligan/,
    'Mary-Ann' => qr/Mary-Ann/,
    Ginger     => qr/Ginger/,
    Professor  => qr/(?:The )?Professor/,
    Skipper    => qr/Skipper/,
    'A Howell' => qr/Mrs?. Howell/,
);

sub rightmost {
    # to accept a hash reference, the second parameter should be a scalar,so @patters becomes $patterns
    my( $string, $patterns ) = @_;

    # add a variable to keep the key of the rightmost pattern called $key
    my $rightmost = -1;
    my $key = undef;

    # to iterate the hash,dereference the scalar parameter, i.e. @patterns bbecomes %$patters
    while( my( $i, $pattern ) = each %$patterns ) {
        my $position = $string =~ m/$pattern/ ? $-[0] : -1;

        # store the key if the pattern match is more to the right than the previous one
        if ($position > $rightmost) {
            $key = $i;
            $rightmost = $position;
        }
    }

    #return the key and the position
    return ($key, $rightmost);
}

say "found ", (rightmost('There is Mrs. Howell, Ginger, and Gilligan', \%patterns))[0];
