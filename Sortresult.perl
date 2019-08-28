#!/usr/bin/perl
use strict;
use warnings;
use 5.010;
 
use Data::Dumper qw(Dumper);

open MYHANDLE, "dados.txt" or die "Unable to Open: $! \n";

while (<MYHANDLE>) {

	printf ("Got $_ \n");
	
	my @line = split (',', $_);
	
	printf ("$line[0] $line[1] $line[2] . \n");
	

}
 
 
my @words = qw(foo bar zorg moo);
 
say Dumper \@words;
 
my @sorted_words = sort @words;
 
say Dumper \@sorted_words;

close MYHANDLE

