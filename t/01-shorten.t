#!perl -T

use Algorithm::URL::Shorten qw(shorten_url);

use Test::More tests => 4;

my $shorts = shorten_url("http://perl.org", 6);

is(@{$shorts}[0], "isazkm");
is(@{$shorts}[1], "mBvzxc");
is(@{$shorts}[2], "soerqC");
is(@{$shorts}[3], "dtvydF");
