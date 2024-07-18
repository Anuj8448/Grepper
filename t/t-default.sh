#!/bin/sh
# Testing default signatures and invocation

test_description='Default signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'Default signature syntax test' '../grepper -d ../signatures/default.db anotherfile'
test_expect_code 1 'Default context argument' '../grepper -c 5 -d ../signatures/default.db anotherfile'
test_expect_code 1 'Default no color test' '../grepper -z -d ../signatures/default.db anotherfile'
test_expect_code 2 'Default no such file test' '../grepper -d ../signatures/default.db nosuchfile'
test_expect_success 'Default broken rules test' 'test $(../grepper -B -z -d ../signatures/default.db nomatch.txt | wc -l) -eq 0'
test_done
