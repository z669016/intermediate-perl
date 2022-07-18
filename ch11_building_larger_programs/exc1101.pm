package Oogaboogoo::Date;

use strict;
use warnings FATAL => 'all';

my @days = qw(ark dip wap sen pop sep kir);
sub number_to_day_name {
    my $day_num = shift @_;
    if (not defined $day_num) {
        die "missing parameter day_num in call to 'number_to_day_name'";
    }
    if ($day_num < 0 || $day_num > $#days) {
        die "invalid day_num in call to 'number_to_day_name', value must be in the range 0..$#days and is '$day_num'";
    }

    $days[$day_num];
}

my @months = qw(diz pod bod rod sip wax lin sen kun fiz nap dep);
sub number_to_month_name {
    my $month_num = shift @_;
    if (not defined $month_num) {
        die "missing parameter month_num in call to 'number_to_month_name'";
    }
    if ($month_num < 0 || $month_num > $#months) {
        die "invalid month_num in call to 'number_to_month_name', value must be in the range 0..$#months and is '$month_num'";
    }

    $months[$month_num];
}

1;