#!/bin/sh
# Testing all signatures and invocation

test_description='Asp signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'ASP signature syntax test' '../grepper -d ../signatures/asp anotherfile'
test_expect_code 1 'ASP context argument' '../grepper -c 5 -d ../signatures/asp anotherfile'
test_expect_code 1 'ASP no color test' '../grepper -z -d ../signatures/asp anotherfile'
test_expect_code 2 'ASP no such file test' '../grepper -d ../signatures/asp nosuchfile'
test_expect_success 'ASP broken rules test' 'test $(../grepper -B -z -d ../signatures/asp.db nomatch.txt | wc -l) -eq 0'
test_done
