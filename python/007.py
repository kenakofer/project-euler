#!/usr/bin/env python3
'''
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

What is the 10 001st prime number?
'''
from helpers import *

primes = find_primes(100000000, count=10001)
print(primes[10000])
