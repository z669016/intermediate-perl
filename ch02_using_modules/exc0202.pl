#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use Module::CoreList qw / /;

my $version = "5.014002";
my %modules = %{ $Module::CoreList::version{$version} };

foreach (sort keys %modules) {
    print $_, " => ", Module::CoreList->first_release($_), "\n";
}
__END__
