#!/bin/sh
# Testing COBOL signatures and invocation

test_description='COBOL signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'COBOL signature syntax test' '../grepper -d ../signatures/cobol.db anotherfile'
test_expect_code 1 'COBOL context argument' '../grepper -c 5 -d ../signatures/cobol.db anotherfile'
test_expect_code 1 'COBOL no color test' '../grepper -z -d ../signatures/cobol.db anotherfile'
test_expect_code 2 'COBOL no such file test' '../grepper -d ../signatures/cobol.db nosuchfile'
test_expect_success 'COBOL broken rules test' 'test $(../grepper -B -z -d ../signatures/cobol.db nomatch.txt | wc -l) -eq 0'
test_done
