#!/usr/bin/env python3
'''
Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.

For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.

What is the total of all the name scores in the file?
'''
from helpers import *

def numeric_score(char):
    return ord(char.upper()) - ord('A') + 1

with open('022_names.txt','r') as f:
    line = f.readline()
names = line.replace('"','').split(',')
names.sort()

assert names[937] == 'COLIN'
assert sum(map(numeric_score, 'COLIN')) == 53

print(sum([ (i+1)*sum(map(numeric_score, names[i])) for i in range(len(names)) ]))
