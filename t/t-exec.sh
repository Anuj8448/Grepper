#!/bin/sh
# Testing Exec signatures and invocation

test_description='Exec signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'Exec signature syntax test' '../grepper -d ../signatures/exec.db anotherfile'
test_expect_code 1 'Exec context argument' '../grepper -c 5 -d ../signatures/exec.db anotherfile'
test_expect_code 1 'Exec no color test' '../grepper -z -d ../signatures/exec.db anotherfile'
test_expect_code 2 'Exec no such file test' '../grepper -d ../signatures/exec.db nosuchfile'
test_expect_success 'Exec broken rules test' 'test $(../grepper -B -z -d ../signatures/exec.db nomatch.txt | wc -l) -eq 0'
test_done
