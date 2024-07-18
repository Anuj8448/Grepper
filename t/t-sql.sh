#!/bin/sh
# Testing SQL signatures and invocation

test_description='SQL signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'SQL signature syntax test' '../grepper -d ../signatures/sql.db anotherfile'
test_expect_code 1 'SQL context argument' '../grepper -c 5 -d ../signatures/sql.db anotherfile'
test_expect_code 1 'SQL no color test' '../grepper -z -d ../signatures/sql.db anotherfile'
test_expect_code 2 'SQL no such file test' '../grepper -d ../signatures/sql.db nosuchfile'
test_expect_success 'SQL broken rules test' 'test $(../grepper -B -z -d ../signatures/sql.db nomatch.txt | wc -l) -eq 0'
test_done
