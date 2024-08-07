#!/bin/sh
# Testing php signatures and invocation

test_description='PHP signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'PHP signature syntax test' '../grepper -d php anotherfile'
test_expect_code 1 'PHP context argument' '../grepper -c 5 -d php anotherfile'
test_expect_code 1 'PHP no color test' '../grepper -z -d php anotherfile'
test_expect_code 2 'PHP no such file test' '../grepper -d php nosuchfile'
test_expect_success 'PHP broken rules test' 'test $(../grepper -B -z -d ../signatures/php.db nomatch.txt | wc -l) -eq 0'
test_done
