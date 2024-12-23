#!/bin/sh
# Testing nim signatures and invocation

test_description='Nim signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'Nim signature syntax test' '../grepper -d ../signatures/nim.db anotherfile'
test_expect_code 1 'Nim context argument' '../grepper -c 5 -d ../signatures/nim.db anotherfile'
test_expect_code 1 'Nim no color test' '../grepper -z -d ../signatures/nim.db anotherfile'
test_expect_code 2 'Nim no such file test' '../grepper -d ../signatures/nim.db nosuchfile'
test_expect_success 'Nim broken rules test' 'test $(../grepper -B -z -d ../signatures/nim.db nomatch.txt | wc -l) -eq 0'
test_done
