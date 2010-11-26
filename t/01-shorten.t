#!perl -T

use Algorithm::URL::Shorten qw(shorten_url);

use Test::More tests => 4;

my $shorts = shorten_url("http://perl.org", 5);

is(@{$shorts}[0], "ijiPy");
is(@{$shorts}[1], "SDnDf");
is(@{$shorts}[2], "qfja5");
is(@{$shorts}[3], "Hzfn8");
