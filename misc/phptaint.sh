#!/bin/sh
# PHP taint checking with grepper - PoC script
# Written by Wireghoul - http://www.justanotherhacker.com
# Released under the GPL licence
VERSION=0.1
if [ -z "$1" ]; then
    echo "Usage: $0 /path/to/check"
    exit 2
fi
grepper -z -d php "$1" | \
perl -ne 'if ($_ =~ m/\$(\S+?)\s*=\s*\$_(GET|POST|REQUEST|COOKIE|FILES)\[.*?\]/) { print "\\\$$1\n"; }' | \
sort | uniq | \
grepper -d /dev/stdin "$1"
