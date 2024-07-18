#!/bin/sh
# Testing Ruby signatures and invocation

test_description='Ruby signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'Ruby signature syntax test' '../grepper -d ../signatures/ruby.db anotherfile'
test_expect_code 1 'Ruby context argument' '../grepper -c 5 -d ../signatures/ruby.db anotherfile'
test_expect_code 1 'Ruby no color test' '../grepper -z -d ../signatures/ruby.db anotherfile'
test_expect_code 2 'Ruby no such file test' '../grepper -d ../signatures/ruby.db nosuchfile'
test_expect_success 'Ruby broken rules test' 'test $(../grepper -B -z -d ../signatures/ruby.db nomatch.txt | wc -l) -eq 0'
test_done
