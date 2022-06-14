#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use File::Spec;
use Cwd;

my $curdir = getcwd;
my @files_names = glob "*";
print map {" " x 4 . File::Spec->catfile($curdir, $_) . "\n"} @files_names;
__END__
