#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use utf8;

use File::Find;
use Time::Local;

sub gather_mtime_between {
    my @yield;
    my $start = shift;
    my $stop = shift;

    my sub gather {
        return unless -f $_ && $start <= (stat $_)[9] and (stat $_)[9] <= $stop;
        push @yield, $File::Find::name;
    }

    my sub yield {
        @yield;
    }

    return ( \&gather, \&yield);
}

my $target_dow = 5;        # Sunday is 0, Monday is 1, ...
my @starting_directories = (".");

my $seconds_per_day = 24 * 60 * 60;
my ($day, $mon, $yr) = (localtime)[3, 4, 5];
my $start = timelocal(0, 0, 0, $day, $mon, $yr);        # midnight today

# move back in time,this algorithm is not DST proof
while (1) {
    my $dow = (localtime($start))[6];
    last if $dow == $target_dow;

    $start -= $seconds_per_day;
}
my $stop = $start + $seconds_per_day;

my($gather, $yield)  = gather_mtime_between($start, $stop);
find($gather, @starting_directories);
my @files = $yield->(  );

for my $file (@files) {
    my $mtime = (stat $file)[9];        # mtime via slice
    my $when = localtime $mtime;
    print "$when: $file\n";
}