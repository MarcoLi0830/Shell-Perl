#!/usr/bin/python3
import sys

DICT = {}
result = ""
token = False
for line in sys.stdin.readlines():
    line=line.strip('\n')
    words = line.split(" ")
    for word in words:
        for letter in word.lower():
            if(letter in DICT.keys()):
                DICT[letter] = DICT[letter] + 1
            else:
                DICT[letter] = 1
        if len(set(DICT.values())) == 1:
            token = True
            result = result + word + " "
        DICT = {}
    if token:
        result = result.strip()
        result = result + '\n'
    else:
        result = result + '\n'
    token = False
print(result,end='')


