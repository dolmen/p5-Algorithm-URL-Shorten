#!perl -T

use Algorithm::URL::Shorten qw(shorten_url);

use Test::More tests => 1;

is_deeply shorten_url("http://perl.org"), [ qw(iqGzim S515va qmKrq8 HXv4HD) ], "http://perl.org";
