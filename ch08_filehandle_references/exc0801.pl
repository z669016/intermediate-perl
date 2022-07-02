#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use IO::Tee;

# use '+' as argument or no arguments, to print to scalar value
# use filename as an argument to print to a file
# use both ... and print to both

sub init_fh {
    my $p1 = shift;
    my $p2 = shift;

    my $string;
    my @handles;

    if (($p1 and $p1 eq "+") || ($p2 and $p2 eq "+") || (!$p1 and !$p2)) {
        open my $string_fh, ">", \$string;
        push @handles, $string_fh;
    }

    if (($p1 and $p1 ne "+") || ($p2 and $p2 ne "+")) {
        my $file_name = ($p1 ne "+") ? $p1 : $p2;
        open my $file_fh, ">", $file_name;
        push @handles, $file_fh;
    }

    (IO::Tee->new(@handles), \$string);
}

sub message {
    my ($day, $mon, $yr, $dow) = (localtime)[3, 4, 5, 6];
    my @day_of_week = qw/Sunday Monday Tuesday Wednesday Thursday Friday Saturday/;

    sprintf "%s %02d-%02d-%04d\n", $day_of_week[$dow], $day, $mon + 1, $yr + 1900;
}

my ($fh, $string_ref) = init_fh(@ARGV);
printf {$fh} message;
if (defined $$string_ref) {
    print $$string_ref;
}