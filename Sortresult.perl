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
  my $qtde_bolas = $ref->{'qtde_bolas'};
}


my $query_fields = "insert into resultados (";
my $query_values = " values ( ";


while (<MYHANDLE>) {

#	printf ("\n\n\nGot $_ \n");
	my $line1 = $_;
	$line1 =~ s/\n//g;
	
	my @line = split (',', $line1);
	
	$query_fields = $query_fields."cod_loteria, ";
	my $concurso = $line[0];
	$query_values = $query_values.$concurso.", ";
	
	$query_fields = $query_fields."num_concurso, ";
	my $data = $line[1];
	$query_values = $query_values.$concurso.", ";
	
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
		printf ("$sortedarray[$t1] ");
		print OUTHANDLE "$sortedarray[$t1]," ;
			
	}
	
	my $array_count = 0;
	for (my $count = 1; $count <= $qtde_bolas; $count++){
		my $count_formated = sprintf("%02d", $count);
		if ($array_count == $count){
			$query_fields = $query_fields."bola".$count_formated.", ";
			$query_values = $query_values."1, ";
		}
		else{
			$query_fields = $query_fields."bola".$count_formated.", ";
			$query_values = $query_values."0, ";
		}
	
	}
	print OUTHANDLE "\n";
}


 # set the value of your SQL query
#my $query = "insert into concursos (cod_lot, num_concurso, data_concurso)";
#$query = $query." values (?, ?, ?) ";

#my $query_fields = "insert into resultados (";
#my $query_values = " values (?, ?, ?) ";

my $query = $query_fields.$query_values;

print ("Query: $query \n");

# prepare your statement for connecting to the database
#my $statement = $dbh->prepare($query);

# execute your SQL statement
#$statement->execute('1', '123', '25102019');


# now retrieve data from the table.
#my $sth = $dbh->prepare("SELECT * FROM tipo_loterias");
#$sth->execute();
#while (my $ref = $sth->fetchrow_hashref()) {
#  print "Found a row: id = $ref->{'cod_lot'}, name = $ref->{'nome_lot'}\n";
#}



$sth->finish();


$dbh->disconnect();
say "Disconnected to the MySQL database.";

close MYHANDLE;
close OUTHANDLE;
