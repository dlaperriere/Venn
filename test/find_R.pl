#!/usr/bin/env perl

=head1 Description

  find R path

=cut

use strict;
use warnings;

use Env;
use IPC::Cmd qw[can_run run];

sub find_R() {
    my $R     = "not found ...";
    my $found = 0;

    # R is in path
    my ( $ok, $err ) = run( command => "R --version", verbose => 0 );
    if ($ok) {
        $R     = "R";
        $found = 1;
    }

    # R_HOME
    if ( not $found ) {
        if ( defined $ENV{"R_HOME"} ) {
            $R = join( "/", $ENV{"R_HOME"}, "bin", "R" );
            $found = 1;
        }
    }

    # windows registry
    if ( not $found ) {

        my ( $ok, $err, $output ) = run(
            command =>
'cmd /c %SystemRoot%\\system32\\reg.exe query HKLM\SOFTWARE\R-core /s /f InstallPath',
            verbose => 0
        );
        if ($ok) {
            foreach my $line (@$output) {
                chomp($line);
                if ( $line eq "    " ) { next; }

                if ( defined $line and -e $line ) {
                    $found = 1;
                    $R = "\"" . join( "\\", $line, "bin", "R.exe" ) . "\"";

                }
            }
        }

    }

    return $R;
}

my $R_path = &find_R();
print STDERR "$R_path\n";
if ( $R_path ne "not found ..." ) {
    my ( $ok, $err ) = run( command => "$R_path --version", verbose => 0 );
}

