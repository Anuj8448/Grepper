#!/bin/sh
# Testing perl signatures and invocation

test_description='Perl signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'Perl signature syntax test' '../grepper -d ../signatures/perl.db anotherfile'
test_expect_code 1 'Perl context argument' '../grepper -c 5 -d ../signatures/perl.db anotherfile'
test_expect_code 1 'Perl no color test' '../grepper -z -d ../signatures/perl.db anotherfile'
test_expect_code 2 'Perl no such file test' '../grepper -d ../signatures/perl.db nosuchfile'
test_expect_success 'Perl broken rules test' 'test $(../grepper -B -z -d ../signatures/perl.db nomatch.txt | wc -l) -eq 0'
test_done
