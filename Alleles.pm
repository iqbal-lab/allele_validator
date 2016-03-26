package Alleles;

use strict;
use warnings;

use base 'Exporter';
our @EXPORT = qw( func1 func2);

## Assumptions:
## ref has one chrom
## haploid
## (will ignore hets)
sub get_clustered_alleles_and_hashes
{
    my ($vcf, $window,
	$href_clusterid_to_var_ids, 
	$href_clusterid_to_seq,
	$href_clusterid_to_intmap) = @_;

    my $clusterid=1;

    open (FILE, $vcf) || die();
    while (<FILE>)
    {
	my $line = $_;
	chomp $line;

	if ($line =~ /^\#/)
	{
	    
	}
	else
	{
	    my @sp = split(/\t/, $line);
	    my $pos = $sp[1];
	    my $format = $sp[8];
	    my @format_sp=();
	    my $format_index=-1;
	    if ($format =~ /:/)
	    {
		@format_sp=split(/:/, $format);
		my $i;
		for ($i=0; $i<scalar(@format_sp); $i++)
		{
		    if ($format_sp[$i] eq "GT")
		    {
			$format_index=$i;
		    }
		}
		if ($format_index==-1)
		{
		    die("No genotype on line $line");
		}
	    }
	    my $gt_fields=$sp[9];
	    if ($format_index==-1)
	    {
		##there is only GT
		if ( ($gt_fields eq "1")
		     ||
		     ($gt_fields eq "1/1") )
		{
		}
	    }
	}
    }
    close(FILE);
}

