#!/bin/bash

filename="$1"
cat $filename | egrep "COMP[29]041" | cut -d'|' -f3 | cut -d',' -f2 | cut -d' ' -f2 | sort | uniq -c | sort -r | sed "s/[0-9 ]//g"| head -1