#!/usr/bin/env python3
'''
2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
'''
from helpers import *
n=1
for o in range(1,20):
    n = LCM(o,n)
print(n)

