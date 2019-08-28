#!/usr/bin/perl
use strict;
use warnings;
use 5.010;
 
use Data::Dumper qw(Dumper);

open MYHANDLE, "dados.txt" or die "Unable to Open: $! \n";

while (<MYHANDLE>) {

	printf ("Got $_ \n");
	
	my @line = split (',', $_);
	
	
	my @arr;
	
	for (my $t = 2; $t < 17 ;$t+=1) {
		printf ("$line[$t] ");
		push @arr, $line[$t];
	}
	
	my @words = qw(@arr);
	#Dumper \@words;
	say Dumper \@words;
 
	my @sorted_words = sort @words;
 
	Dumper \@sorted_words;
#	say Dumper \@sorted_words;

	for (my $t1 = 0; $t1 < 15 ;$t1+=1) {
		printf ("$sorted_words[$t1] ");
		
	}

}
 


 

 

close MYHANDLE;
