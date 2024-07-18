#!/bin/sh
# Testing invocation and command arguments

test_description="Invocation checks"
. ./test-lib.sh

# Tests
test_expect_code 2 'usage check' '../grepper'
test_expect_code 1 'Banner suppressed' '../grepper -B anotherfile'
test_expect_code 1 'Context argument check' '../grepper -c 3 anotherfile'
test_expect_code 1 'Help text test' '../grepper -h'
test_expect_code 1 'Case insensitive search' '../grepper -i anotherfile'
test_expect_success 'list databases' '../grepper -l'
test_expect_code 1 'Vim lines test' '../grepper -L anotherfile'
test_expect_success 'version check' '../grepper -v'
test_expect_success 'Banner version check' 'v=$(../grepper -v|cut -d" " -f 3);test $(grep -F $v ../grepper| grep Wireghoul|wc -l) -eq 1'
test_expect_code 1 'exclude files check' '../grepper -x *.js anotherfile'
test_expect_code 1 'Supress colors check' '../grepper -z anotherfile'
test_expect_code 1 'High contrast color check' '../grepper -Z anotherfile'
test_expect_code 1 'Colour blind support check' '../grepper -b anotherfile'
test_expect_code 1 'GRARGS environment variable test' 'GRARGS="-B -z" ../grepper anotherfile'
test_expect_code 1 'GRDIR environment variable test' 'GRDIR=../misc/ ../grepper -d rce anotherfile'
test_expect_code 2 'bad argument' '../grepper -99'
test_expect_code 1 'Remove carriage returns', 'echo "" | ../grepper -B -d - crlf.txt | xxd | grep -c 0d'
test_done
