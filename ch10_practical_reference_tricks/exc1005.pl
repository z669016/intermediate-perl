#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use Data::Dumper;
use File::Basename;
use File::Spec::Functions;

use File::HomeDir qw(home);
use File::Spec::Functions qw(catfile);

my $DEPTH_FIRST = "depth-first";
my $BREADTH_FIRST = "breadth-first";

sub data_for_path {
    my( $path, $threshold, $search) = @_;
    my $NO_ACCESS = "<<NO ACCESS>>";

    $threshold //= 1;
    $search //= $DEPTH_FIRST;

    my $data = {};
    my @queue = ( [ $path, 0, $data ] );

    while( my $next = shift @queue ) {
        my( $path, $level, $ref ) = @$next;
        my $basename = basename( $path );
        $ref->{$basename} = do {
            if( -f $path or -l $path ) { undef }
            elsif ($path eq $NO_ACCESS) { undef }
            else {
                my $hash = {};
                if( $level < $threshold ) {
                    #vprint "Scanning $path\n";
                    my $ok = opendir my ($dh), $path;
                    if (!$ok) {
                        push @queue, map {[ $_, $level + 1, $hash ]} $NO_ACCESS;
                    } else {
                        my @new_paths = map {
                            catfile($path, $_)
                        } grep {!/^\.\.?\z/} readdir $dh;

                        if ($search eq $DEPTH_FIRST) {
                            unshift @queue, map {[ $_, $level + 1, $hash ]} @new_paths;
                        } else {
                            push @queue, map {[ $_, $level + 1, $hash ]} @new_paths;
                        }
                    }
                }
                $hash;
            }
        };
    }

    $data;
}

sub print_data_for_path {
    my ($hash, $level) = @_;
    $level //= 0;

    foreach (sort keys %$hash) {
        print "  " x $level;
        print;
        print ", with contents:" if defined $$hash{$_};
        print "\n";
        print_data_for_path($$hash{$_}, $level + 1) if defined $$hash{$_};
    }
}

my $data = data_for_path( home(), 3, $BREADTH_FIRST);
print_data_for_path($data);
