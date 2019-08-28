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

	printf ("Arr ");
	
	for (my $t = 0; $t < 15 ;$t+=1) {
		printf ("$arr[$t] ");
	}
	
#	my @array = qw(1 2 3 4 5);
	sub numerically {$a <=> $b}
	my @sortedarray = sort numerically @arr;

print "Sorted: @sortedarray\n";
	
#	my @words = qw(@arr);
	#Dumper \@words;
#	say Dumper \@words;
 
#	my @sorted_words = sort @words;
 
#	Dumper \@sorted_words;
#	say Dumper \@sorted_words;

	for (my $t1 = 0; $t1 < 15 ;$t1+=1) {
		printf ("$sortedarray[$t1] ");
		
	}

}
 


 

 

close MYHANDLE;
