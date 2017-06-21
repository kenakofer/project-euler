#!/usr/bin/env python3
'''
Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.

How many such routes are there through a 20×20 grid?
'''

def factorial(n):
    if n<=0:
        return 1 
    return n*factorial(n-1)

# 40 choose 20
print(factorial(40) // factorial(20) // factorial(20))
