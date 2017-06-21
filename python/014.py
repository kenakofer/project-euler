#!/usr/bin/env python3


'''
without caching, takes 135 seconds
with caching, takes 5 seconds
'''

longestc=0
longestn=0
cache={}


def get_collatz_length(n):
    global cache
    if n in cache:
        return cache[n]
    return_val = -1
    if n == 1:
        return_val = 1
    elif n%2 == 0:
        return_val = 1 + get_collatz_length(n//2)
    else:
        return_val = 1 + get_collatz_length(3*n+1)
    cache[n] = return_val
    return return_val

for n in range(5,1000000):
    count = get_collatz_length(n)
    if count>longestc:
        longestc=count
        longestn=n

#print(longestc)
print(longestn)
