#!/usr/bin/env python3
'''
2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 2^1000?
'''
import math

def digit_sum(n):
    string=str(n)
    return sum(map(int, string))

print(digit_sum(pow(2,1000)))


