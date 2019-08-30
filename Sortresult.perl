#!/usr/bin/perl
use strict;
use warnings;
#use 5.010;
use v5.10; # for say() function
use DBI;
 
use Data::Dumper qw(Dumper);

open MYHANDLE, "dados.txt" or die "Unable to Open: $! \n";
open OUTHANDLE, ">dados1.dat" or die ("Cannot open dados1.dat");
my $tipo_loteria = 1;

 

say "Perl MySQL Connect";
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


# now retrieve data from the table.
my $sth = $dbh->prepare("select qtde_bolas from tipo_loterias
where nome_loteria='LOTOFACIL';");

$sth->execute();

while (my $ref = $sth->fetchrow_hashref()) {
  print "Found a row: qtde_bolas = $ref->{'qtde_bolas'}\n";
}


# set the value of your SQL query
#my $query = "insert into concursos (cod_lot, num_concurso, data_concurso)";
#$query = $query." values (?, ?, ?) ";

my $query = "insert into resultados (";

print ("Query: $query");

# prepare your statement for connecting to the database
#my $statement = $dbh->prepare($query);

# execute your SQL statement
#$statement->execute('1', '123', '25102019');







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
#	print "Sorted2: " ;
	for (my $t1 = 0; $t1 < 15 ;$t1+=1) {
#		printf ("$sortedarray[$t1] ");
		print OUTHANDLE "$sortedarray[$t1]," ;
		
	}
	print OUTHANDLE "\n";
}
 

# now retrieve data from the table.
my $sth = $dbh->prepare("SELECT * FROM tipo_loterias");
$sth->execute();
while (my $ref = $sth->fetchrow_hashref()) {
  print "Found a row: id = $ref->{'cod_lot'}, name = $ref->{'nome_lot'}\n";
}
$sth->finish();


$dbh->disconnect();
say "Disconnected to the MySQL database.";

close MYHANDLE;
close OUTHANDLE;
