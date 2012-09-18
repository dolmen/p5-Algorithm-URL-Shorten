package Algorithm::URL::Shorten;

use strict;
use warnings;

use Digest::MD5 qw(md5);

require Exporter;

our @ISA = qw(Exporter);

=head1 NAME

Algorithm::URL::Shorten - URL shortening algorithm

=head1 SYNOPSIS

Algorithm::URL::Shorten generates short codes used to map and represent
longer URLs.

    use Algorithm::URL::Shorten qw(shorten_url);

    my $shorts = shorten_url("http://perl.org");

    foreach $code (@{$shorts}) {
        print $code, "\n";
    }

This code prints

    iqGzim
    S515va
    qmKrq8
    HXv4HD

=head1 DESCRIPTION

The codes generated with Algorithm::URL::Shorten are unique for every URL, so
that every time it is used on the same URL, it will generate the same codes.

The short strings are alphanumeric ASCII ([a-z,A-Z,0-9]) for a total of 62
characters, which may be mapped in 62 ^ 6 different codes.

=head1 EXPORT

The module exports the subroutine C<shorten_url> on request.

=cut

our @EXPORT_OK = qw(shorten_url);

my @CHARS = ('a'..'z', 'A'..'Z', '0'..'9');

=head1 SUBROUTINES

=head2 shorten_url( $url )

This function takes as arguments an URL to shorten, and returns an array
reference containing 4 strings.

The generated codes will be of six characters long.

=cut

sub shorten_url {
	my $url= shift;

	my @output;

	foreach my $int (unpack('N4', md5($url))) {

		my $out;
		for (my $j = 0; $j < 6; $j++) {
			my $val = 0x0000003D & $int;
			$out   .= $CHARS[$val];
			$int    = $int >> 5;
		}

		push @output, $out;
	}

	return \@output;
}


=head1 ACKNOWLEDGMENTS

From version 0.03 the algorithm for generating short codes has slightly
changed due to some bugs in the code. The codes generated by the algorithm
v0.02 and v0.01 are not compatible with the new version.

=head1 AUTHOR

Alessandro Ghedini <alexbio@cpan.org>

=head1 LICENSE AND COPYRIGHT

Copyright 2011 Alessandro Ghedini.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.

=cut

1; # End of Algorithm::URL::Shorten
