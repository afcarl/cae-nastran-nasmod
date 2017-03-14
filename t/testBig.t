use strict;
use Test;
use Data::Dumper;

BEGIN { plan tests => 7 }

use lib("../lib");
use CAE::Nastran::Nasmod;

#------------------------------
# 1) genrate a model with 2000000 GRIDs
{
	my $model = CAE::Nastran::Nasmod->new();

#	$model->index(2);


	my $anzahl = 2000;

	my $time = time;
	foreach(1..$anzahl)
	{
		my $entity = CAE::Nastran::Nasmod::Entity->new();
		my @row = ("Generiertes Grid $_", "GRID", "$_", "", "0.", "0.", "0.");
		$entity->setRow(\@row);
		$model->addEntity($entity);
	}
	my $time2 = time;
#	print "seconds for generating $anzahl GRIDs: " . ($time2-$time) ."\n";

	ok($model->hasIndex(), 0);

	$time = time;
	my $newModel = $model->filter(["", "GRID", $anzahl]);

	ok($newModel->count(), 1);
	$time2 = time;
#	print "no index: seconds for filtering for a specific GRID: " . ($time2-$time) ."\n";

#	$model->print();
	ok($model->count(), $anzahl);
	
	$time = time;
#	$model->index(2);
	ok($model->hasIndex(), 0);
	$time2 = time;
#	print "seconds for indexing columns 2: " . ($time2-$time) ."\n";

	$time = time;
	my $newModel2 = $model->filter(["", "GRID", $anzahl]);
	ok($newModel2->count(), 1);
	$time2 = time;
#	print "full index: seconds for filtering for a specific GRID: " . ($time2-$time) ."\n";

#	print Dumper $model;

#	my %OPTIONS = (
#	cards => ["GRID"],
#		filter => ["", "GRID"],
#	);

}
#------------------------------

