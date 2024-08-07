#!/bin/sh
# Testing kotlin signatures and invocation

test_description='Kotlin signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'Kotlin signature syntax test' '../grepper -d ../signatures/kotlin.db anotherfile'
test_expect_code 1 'Kotlin context argument' '../grepper -c 5 -d ../signatures/kotlin.db anotherfile'
test_expect_code 1 'Kotlin no color test' '../grepper -z -d ../signatures/kotlin.db anotherfile'
test_expect_code 2 'Kotlin no such file test' '../grepper -d ../signatures/kotlin.db nosuchfile'
test_expect_success 'Kotlin broken rules test' 'test $(../grepper -B -z -d ../signatures/kotlin.db nomatch.txt | wc -l) -eq 0'
test_done
