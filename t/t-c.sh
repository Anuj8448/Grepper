#!/bin/sh
# Testing C signatures and invocation

test_description='C signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'C signature syntax test' '../grepper -d ../signatures/c.db anotherfile'
test_expect_code 1 'C context argument' '../grepper -c 5 -d ../signatures/c.db anotherfile'
test_expect_code 1 'C no color test' '../grepper -z -d ../signatures/c.db anotherfile'
test_expect_code 2 'C no such file test' '../grepper -d ../signatures/c.db nosuchfile'
test_expect_success 'C broken rules test' 'test $(../grepper -B -z -d ../signatures/c.db nomatch.txt | wc -l) -eq 0'
test_done
