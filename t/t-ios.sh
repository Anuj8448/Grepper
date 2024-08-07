#!/bin/sh
# Testing iOS signatures and invocation

test_description='iOS signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'iOS signature syntax test' '../grepper -d ../signatures/ios.db anotherfile'
test_expect_code 1 'iOS context argument' '../grepper -c 5 -d ../signatures/ios.db anotherfile'
test_expect_code 1 'iOS no color test' '../grepper -z -d ../signatures/ios.db anotherfile'
test_expect_code 2 'iOS no such file test' '../grepper -d ../signatures/ios.db nosuchfile'
test_expect_success 'iOS broken rules test' 'test $(../grepper -B -z -d ../signatures/ios.db nomatch.txt | wc -l) -eq 0'
test_done
