#!/bin/sh

egrep 'COMP[29]041' "$1" |  cut -d'|' -f3 | cut -d',' -f2 | sed 's/^ //g' | cut -d' ' -f1 | sort | uniq -c | sort -n | tail -1 | cut -c9-
