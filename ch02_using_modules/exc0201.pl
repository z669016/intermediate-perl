#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use File::Spec;
use Cwd;

my $curdir = getcwd;
my @files_names = glob "*";
print " " x 4, File::Spec->catfile($curdir, $_), "\n" foreach (@files_names);
__END__
