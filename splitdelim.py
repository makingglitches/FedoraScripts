#!/usr/bin/python3
# right now all this does is split a space delimited
# string that has been translated to squeeze out extra 
# spaces and print whatever column is indexed.
# only really useful because the requirement doesn't 
# exist in any simple way in linux.
from ast import arg
from sys import argv, stdin

if len(argv) <2:
    print ("must specify column number for splitdelim")
    exit(1)

index = int(argv[1])
skip = 0

if (len(argv) > 2):
    skip = int(argv[2])

skipped = 0

for line in stdin:

    if (skip > 0):
        skipped= skipped+1

        if skip >= skipped:
            continue
        else: 
            skip = 0
        
    a = line.split(" ")

    # sometimes the output isn't perfect, as in the cases of captions
    if (len(a) > index):
        print(a[index])
   