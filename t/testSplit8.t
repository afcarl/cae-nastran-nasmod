use strict;
use Test;

BEGIN { plan tests => 7 }

#use lib("../lib");
use CAE::Nastran::Nasmod;

#------------------------------
# 1) addEntity, getEntity, merge
{
	my $line = "CQUAD4      1000     550       1       2       3       4\n";
	
	chomp $line;

	my @line = CAE::Nastran::Nasmod->split8($line);

#	print join("|", @line) . "\n";

	# entity count
	ok(@line, 7);
	
}
#------------------------------

