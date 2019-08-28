#!/usr/bin/perl
use strict;
use warnings;
use 5.010;
 
use Data::Dumper qw(Dumper);

open MYHANDLE, "dados.txt" or die "Unable to Open: $! \n";
open OUTHANDLE, ">dados1.dat" or die ("Cannot open dados1.dat");


while (<MYHANDLE>) {

	printf ("\n\n\nGot $_ \n");
	my $line1 = $_;
	$line1 =~ s/\n//g;
	
	my @line = split (',', $line1);
	
	
	my @arr;
	
	for (my $t = 2; $t < 17 ;$t+=1) {
		printf ("$line[$t] ");
		push @arr, $line[$t];
	}

	printf ("\nArr ");
	
	for (my $t = 0; $t < 15 ;$t+=1) {
		printf ("$arr[$t] ");
	}
	
#	my @array = qw(1 2 3 4 5);
	sub numerically {$a <=> $b}
	my @sortedarray = sort numerically @arr;

	print "\nSorted: @sortedarray\n";
	
#	my @words = qw(@arr);
	#Dumper \@words;
#	say Dumper \@words;
 
#	my @sorted_words = sort @words;
 
#	Dumper \@sorted_words;
#	say Dumper \@sorted_words;
	print "Sorted2: " ;
	for (my $t1 = 0; $t1 < 15 ;$t1+=1) {
		printf ("$sortedarray[$t1] ");
		
	}
	print OUTHANDLE @sortedarray;
}
 


close MYHANDLE;
close OUTHANDLE;