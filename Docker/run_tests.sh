#!/bin/env bash

cd /src

#echo Test install Perl requirements
#perl test/install_modules_cpan.pl

#echo Test install R requirements
#R --no-save < install_packages.R

echo -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

echo Test 
bash Jenkins/run_tests.cmd

echo -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-


echo -30-

