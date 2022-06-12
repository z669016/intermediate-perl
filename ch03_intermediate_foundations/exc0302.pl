#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

my $folder = "/etc/";

while (1) {
    print "Enter a search pattern: ";
    chomp(my $pattern = <>);
    last if (length($pattern) == 0);

    my @file_names = eval { grep /$pattern/, map substr($_, length($folder)), glob "$folder*" };
    if (@file_names > 0) {
        print $_, "\n" foreach @file_names;
    } else {
        print "An error occurred on evaluation of the pattern '$pattern'\n";
    }
}

__END__
