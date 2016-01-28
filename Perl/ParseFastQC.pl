#!/usr/bin/perl 
#
use strict;
use warnings;
#read and print each line of each file in a file called filenames.
#prompt  user for printout of filenames
#first on command line, copy all files from subdirectories into a common directory
#--backup=numbered allows you to rename files as you go so they are unique
#mkdir ./reads/fastqcOUT/textsummary/
#find ./reads/fastqcOUT/files/*fastqc/fastqc_data.txt -type f -exec cp --backup=numbered -t ./reads/fastqcOUT/textsummary/ {} +

#-v prints it first, -n makes sure it doesn't actually run until you've checked it.
#rename -v -n 's/fastqc_data.txt.~*~/fastqc_data_/' fastqc_data.txt.~*~
#and then
#rename "s/\~/\.txt/" ./fastqc_data_*

my (@files, $file, $line);
@files = <./reads/fastqcOUT/textsummary/*.txt>;
open (my $out, '>', 'reads/fastqcOUT/ALLfastqc.txt')
	or die "Cannot open output.txt: $!";
foreach $file (@files) {
	chomp $file;
	print $file . "\n";
	open (FILE, $file) or die "Can't open '$file': $!";
		my $i =1;
		while (<FILE>) { #second while block
			if ($i>10) {last;}
			print $out $_;
			$i++;
		} #end second while block
	close (FILE);
} #end first while block
close ($out);


# my (@files, $file, $line);
# use File::Slurp;
# @files = read_dir './reads/fastqcOUT/textsummary/';
# foreach $file (@files) {
# 	chomp $file;
# 	print "$file \n";
# 	open (FILE, $file) or die "Can't open '$file': $!";
# 		while ($line = <FILE>) { #second while block
# 			print "$line";
# 		} #end second while block
# 	close (FILE);
# } #end first while block
	

# $userword = <STDIN>;
# chomp $userword;
# open (IN, 'filenames');
# while ($file = <IN>) { #first while block
# 	open (FILE, $file);
# 		while ($line = <FILE>) { #second while block
# 			print "$line";
# 		} #end second while block
# 	close (FILE);
# } #end first while block