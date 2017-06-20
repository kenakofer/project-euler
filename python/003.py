#!/usr/bin/env python3

'''
The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?
'''
c=2
start=600851475143
n=start
while True:
    if (n==c):
        break
    if (n%c==0):
        #print(c,start/c)
        n/=c
    else:
        c+=1
print(c)
