#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

require "./ch11_building_larger_programs/exc1101.pm";

my(undef, undef, undef, $mday, $mon, $year, $wday) = localtime;
$year += 1900;

print "Today is ", Oogaboogoo::Date::number_to_day_name($wday), " $mday ",
    Oogaboogoo::Date::number_to_month_name($mon), " $year\n";