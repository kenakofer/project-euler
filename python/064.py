#!/usr/bin/env python3
'''
Exactly four continued fractions, for N ≤ 13, have an odd period.

How many continued fractions for N ≤ 10000 have an odd period?
'''
from helpers import *

'''
pass in a,b,c for a / (√b - c)
get out value, (new a, new b, new c)
'''
def get_next(a,b,c):
    #multiply by conjugate
    den = b - c*c
    assert a > 0
    assert den % a == 0
    assert den > 0
    den //= a
    value=0
    #This line gave me so much grief. I thought it was:
    #while c > 0:
    #The problem did not make it clear how to do this bit
    while b > (c - den)**2:
        c -= den
        value += 1
    return value, (den,b,-c)

def get_initial(num):
    return (int(num**.5), (1, num, int(num**.5)))

def get_period(start):
    values = []
    val, (a,b,c) = get_initial(start)
    values.append(val)
    initial = (a,b,c)
    start=True
    while start or (a,b,c) != initial:
        start=False
        #print(a,b,c)
        val, (a,b,c) = get_next(a,b,c)
        values.append(val)
    return len(values)-1



count = 0
for n in range(2,10001):
    if int(n**.5)**2!=n and get_period(n)%2 == 1:
        count+=1
print(count)
