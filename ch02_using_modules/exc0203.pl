#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use Business::ISBN;

my $input = "9781449393090";
my $isbn = Business::ISBN->new($input);

print "ISBN: ", $isbn->as_string, "\n";
print "group code: ", $isbn->group_code, "\n";
print "publisher code: ", $isbn->publisher_code, "\n";
__END__
