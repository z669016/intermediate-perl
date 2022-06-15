#!/usr/bin/perl
use strict;
use warnings;

my %gilligan_info = (
    name     => 'Gilligan',
    hat      => 'White',
    shirt    => 'Red',
    position => 'First Mate',
    location => "The Island",
);
my %skipper_info = (
    name     => 'Skipper',
    hat      => 'Black',
    shirt    => 'Blue',
    position => 'Captain',
    location => "The Island",
);
my %mr_howell_info = (
    name     => 'Mr. Howell',
    hat      => 'White',
    shirt    => 'Yellow',
    position => 'Passenger',
    location => "The Island Country CLub",
);
my %mrs_howell_info = (
    name     => 'Mrs. Howell',
    hat      => 'Red',
    shirt    => 'Pink',
    position => 'Passenger',
    location => "The Island Country CLub",
);

my @crew = (\%gilligan_info, \%skipper_info, \%mr_howell_info, \%mrs_howell_info);

my $format = "%-15s %-7s %-7s %-15s %s\n";
printf $format, qw(Name Shirt Hat Position Location);

foreach my $crewmember (@crew) {
    printf $format, @$crewmember{ qw(name shirt hat position location) };
}