#!/usr/bin/perl
use strict;
use warnings;
//use 5.010;
 
use Data::Dumper qw(Dumper);
 
my @words = qw(foo bar zorg moo);
 
say Dumper \@words;
 
my @sorted_words = sort @words;
 
say Dumper \@sorted_words;


