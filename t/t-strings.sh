#!/bin/sh
# Testing strings signatures and invocation

test_description='Strings signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'Other signature syntax test' '../grepper -d ../signatures/strings.db anotherfile'
test_expect_code 1 'Other context argument' '../grepper -c 5 -d ../signatures/strings.db anotherfile'
test_expect_code 1 'Other no color test' '../grepper -z -d ../signatures/strings.db anotherfile'
test_expect_code 2 'Other no such file test' '../grepper -d ../signatures/strings.db nosuchfile'
test_expect_success 'Other broken rules test' 'test $(../grepper -B -z -d ../signatures/strings.db nomatch.txt | wc -l) -eq 0'
test_done
