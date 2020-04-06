use strict;
use warnings;

use File::Find::Rule;
use File::Find::Rule::BOM;
use File::Object;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data')->set;

# Test.
my @ret = File::Find::Rule->bom_utf32->relative->in($data_dir->s);
is_deeply(
	\@ret,
	[
		'UTF_32_bom',
	],
	'Get files with UTF-32 BOM in data directory.',
);
