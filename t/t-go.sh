#!/bin/sh
# Testing Go signatures and invocation

test_description='Go signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'Go signature syntax test' '../grepper -d ../signatures/go.db anotherfile'
test_expect_code 1 'Go context argument' '../grepper -c 5 -d ../signatures/go.db anotherfile'
test_expect_code 1 'Go no color test' '../grepper -z -d ../signatures/go.db anotherfile'
test_expect_code 2 'Go no such file test' '../grepper -d ../signatures/go.db nosuchfile'
test_expect_success 'Go broken rules test' 'test $(../grepper -B -z -d ../signatures/go.db nomatch.txt | wc -l) -eq 0'
test_done
