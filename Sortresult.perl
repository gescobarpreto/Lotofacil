#!/usr/bin/perl
use strict;
use warnings;
use 5.010;
 
use Data::Dumper qw(Dumper);

open MYHANDLE, "dados.txt" or die "Unable to Open: $! \n";

while (<MYHANDLE>) {

	printf ("Got $_ \n");
	
	my @line = split (',', $_);
	
	
	
	
	for (my $t = 2; $t < 17 ;$t+=1) {
		printf ("$line[$t]");
		my @words = qw(@line);
		say Dumper \@words;
 
		my @sorted_words = sort @words;
 
		say Dumper \@sorted_words;
	}

}
 


 

 

close MYHANDLE;
