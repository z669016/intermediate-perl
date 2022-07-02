#!/usr/bin/perl
use 5.10.1;
use strict;
use warnings FATAL => 'all';

sub load_patterns {
    my @patterns;
    my $file_name = "./ch09_regular_expression_references/exc0902.txt";
    open my $fh, "<", $file_name or die "Couldn't open $file_name: $!";
    while (<$fh>) {
        chomp;
        my $pattern = eval { qr/$_/ } or do { warn "Invalid pattern: $@"; next };
        push @patterns, $pattern;
    }

    return \@patterns;
}

my $patterns = load_patterns;
say "\nLoaded patterns:";
while (my ($index, $pattern) = each (@$patterns)) {
    say "$index: $pattern";
}

say "\nEnter a lines to be matched against the patterns:";
while (<STDIN>) {
    chomp;
    last if !length($_);

    foreach my $pattern (@$patterns) {
        print "$. | $_\n" if /$pattern/;
    }
}