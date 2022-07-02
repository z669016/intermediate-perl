#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

my $data_file = "./ch08_filehandle_references/8.2-data-file.txt";
open STDIN, "<", $data_file or die "Could not open $data_file: $!\n";

my %file_fh;
my $count = 1;
while (<>){
    next if /\A\s*#/;
    if (/\A(.+):/) {
        my $castaway = lc($1);
        unless ($file_fh{$castaway}) {
            open $file_fh{$castaway}, ">", $castaway . ".info";
        }
        print {$file_fh{$castaway}} $_;
    } else {
        die "Invalid input line $count: $_\n";
    }
    $count++;
}