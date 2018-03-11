#!/usr/bin/python3
import re,sys

filename = sys.argv[1]

with open(filename) as f:
	file_contents = f.read()

new_file_contents = re.sub(r'[aeiou]','',file_contents, flags=re.I)
with open(filename,'w') as f:
	f.write(new_file_contents)

