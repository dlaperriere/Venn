#!/usr/bin/env perl

=head1 Description

  Install required perl modules from cpan

=cut

use strict;
use warnings;

my @modules =
  ( "IPC::Cmd", "Test::More", "Test::Harness", "TAP::Formatter::JUnit" );

my $cpan = "cpan";

# use alternative path to cpan command
if ( defined $ARGV[0] and -f $ARGV[0] ) {
    $cpan = $ARGV[0];
}

print STDOUT "Using cpan command : $cpan \n";

foreach my $module (@modules) {
    my @cpan_cmd = ( $cpan, "-i", $module );
    system(@cpan_cmd) == 0
      or die "$module installation with $cpan failed : $?\n";
}

