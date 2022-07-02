#!/usr/bin/perl
use 5.10.1;
use strict;
use warnings FATAL => 'all';

use Regexp::Assemble;

sub load_patterns {
    my $ra = Regexp::Assemble->new;
    $ra->add_file({ file => ["./ch09_regular_expression_references/exc0902.txt"], nput_record_separator  => "\n", });
    return $ra->re;
}

my $patterns = load_patterns;
say "\nLoaded patterns:",$patterns;

say "\nEnter a lines to be matched against the patterns:";
while (<STDIN>) {
    chomp;
    last if !length($_);

    print "$. | $_\n" if /$patterns/;

    # (?^:(?:(The\s+)?(Skipper|Professor)|Mary[\s\-]+Anne?|cocoa?n[ue]t)?)
    # (?^:(?:(The\s+)?(Skipper|Professor)|Mary[\s\-]+Anne?|cocoa?n[ue]t))
}