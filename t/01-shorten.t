#!perl -T

use Algorithm::URL::Shorten qw(shorten_url);

use Test::More tests => 2;

is_deeply shorten_url("http://perl.org"), [ qw(iqGzim S515va qmKrq8 HXv4HD) ], "http://perl.org";
is_deeply shorten_url("https://github.com/ghedo/p5-Algorithm-URL-Shorten"), [ qw(PvCGLL 8HfGvK mSHbWf rayKHD) ], "https://github.com/ghedo/p5-Algorithm-URL-Shorten";
