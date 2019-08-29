#!/usr/bin/perl
use strict;
use warnings;
#use 5.010;
use v5.10; # for say() function
use DBI;
 
use Data::Dumper qw(Dumper);

open MYHANDLE, "dados.txt" or die "Unable to Open: $! \n";
open OUTHANDLE, ">dados1.dat" or die ("Cannot open dados1.dat");


 

say "Perl MySQL Connect Demo";
# MySQL database configuration
#my $dsn = "DBI:mysql:loterias:mysqldb.c07fg9lvvdrh.sa-east-1.rds.amazonaws.com";
#my $username = "admin";
#my $password = '123MudarDB';
 
# connect to MySQL database
my %attr = ( PrintError=>0,  # turn off error reporting via warn()
             RaiseError=>1);   # turn on error reporting via die()           
 
#my $dbh  = DBI->connect($dsn,$username,$password, \%attr);

my $dbh = DBI->connect("DBI:mysql:database=loterias;host=mysqldb.c07fg9lvvdrh.sa-east-1.rds.amazonaws.com",
                       "admin", "123MudarDB",
                       {'RaiseError' => 1});
 
say "Connected to the MySQL database.";

while (<MYHANDLE>) {

#	printf ("\n\n\nGot $_ \n");
	my $line1 = $_;
	$line1 =~ s/\n//g;
	
	my @line = split (',', $line1);
	
	
	my @arr;
	
	for (my $t = 2; $t < 17 ;$t+=1) {
#		printf ("$line[$t] ");
		push @arr, $line[$t];
	}

#	printf ("\nArr ");
	
	for (my $t = 0; $t < 15 ;$t+=1) {
#		printf ("$arr[$t] ");
	}
	
#	my @array = qw(1 2 3 4 5);
	sub numerically {$a <=> $b}
	my @sortedarray = sort numerically @arr;

#	print "\nSorted: @sortedarray\n";
	
#	my @words = qw(@arr);
	#Dumper \@words;
#	say Dumper \@words;
 
#	my @sorted_words = sort @words;
 
#	Dumper \@sorted_words;
#	say Dumper \@sorted_words;
	print "Sorted2: " ;
	for (my $t1 = 0; $t1 < 15 ;$t1+=1) {
#		printf ("$sortedarray[$t1] ");
		print OUTHANDLE "$sortedarray[$t1]," ;
		
	}
	print OUTHANDLE "\n";
}
 


close MYHANDLE;
close OUTHANDLE;

$dbh->disconnect();

say "Disconnected to the MySQL database.";
