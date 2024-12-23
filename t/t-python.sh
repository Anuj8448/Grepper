#!/bin/sh
# Testing python signatures and invocation

test_description='Python signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'Python signature syntax test' '../grepper -d ../signatures/python.db anotherfile'
test_expect_code 1 'Python context argument' '../grepper -c 5 -d ../signatures/python.db anotherfile'
test_expect_code 1 'Python no color test' '../grepper -z -d ../signatures/python.db anotherfile'
test_expect_code 2 'Python no such file test' '../grepper -d ../signatures/python.db nosuchfile'
test_expect_success 'Python broken rules test' 'test $(../grepper -B -z -d ../signatures/python.db nomatch.txt | wc -l) -eq 0'
test_done
