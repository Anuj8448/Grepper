#!/bin/sh
# Testing XSS signatures and invocation

test_description='XSS signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'XSS signature syntax test' '../grepper -d ../signatures/xss.db anotherfile'
test_expect_code 1 'XSS context argument' '../grepper -c 5 -d ../signatures/xss.db anotherfile'
test_expect_code 1 'XSS no color test' '../grepper -z -d ../signatures/xss.db anotherfile'
test_expect_code 2 'XSS no such file test' '../grepper -d ../signatures/xss.db nosuchfile'
test_expect_success 'XSS broken rules test' 'test $(../grepper -B -z -d ../signatures/xss.db nomatch.txt | wc -l) -eq 0'
test_done
