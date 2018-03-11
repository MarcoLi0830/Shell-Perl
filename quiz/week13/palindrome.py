#!/usr/bin/python3
import sys,re
s = sys.argv[1]
s = re.sub('[^a-zA-Z]','',s)
s = s.lower()
l = list(s)
list.reverse(l)
s2 = ''.join(l)
if s == s2:
    print("True")
else:
    print("False")
    
