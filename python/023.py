#!/usr/bin/env python3
'''
A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.

As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.

Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
'''
from helpers import *

def is_abundant(n):
    return sum(divisors(n)) > n

def is_funny(n):
    for a in abundant_list:
        if n - a in abundant_set:
            return False
        if a > n/2:
            return True

#print("Finding abundant numbers...")
abundant_list = list(filter(is_abundant, range(12, 28124)))
abundant_set = set(abundant_list)
#print("Done.")

print(sum([i for i in range(1,28124) if is_funny(i)]))


