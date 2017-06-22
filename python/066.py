#!/usr/bin/env python3
'''
Consider quadratic Diophantine equations of the form:

x2 – Dy2 = 1

For example, when D=13, the minimal solution in x is 6492 – 13×1802 = 1.

It can be assumed that there are no solutions in positive integers when D is square.

By finding minimal solutions in x for D = {2, 3, 5, 6, 7}, we obtain the following:

3^2 – 2×2^2 = 1
2^2 – 3×1^2 = 1
9^2 – 5×4^2 = 1
5^2 – 6×2^2 = 1
8^2 – 7×3^2 = 1

Hence, by considering minimal solutions in x for D ≤ 7, the largest x is obtained when D=5.

Find the value of D ≤ 1000 in minimal solutions of x for which the largest value of x is obtained.
'''

'''
Use this method to solve:
https://en.wikipedia.org/wiki/Chakravala_method
'''

from helpers import *
import gmpy
from math import sqrt

'''
a^2 - Db^2 = k
'''
def chakravala_iterate(a,b,k, D):
    assert a*a - D*b*b == k
    #Find an m s.t. (a + bm)/k is integer
    m=int(sqrt(D))
    diff = 0
    best_m = -1
    while True:
        m = int(D**.5) + diff
        if (a + b*m) % k == 0:
            break
        m = int(D**.5) - diff
        if m > 0 and (a + b*m) % k == 0:
            break
        diff+=1

    assert  (a*m + D*b) % abs(k) == 0
    assert (a + b*m) % abs(k) == 0
    assert (m*m  - D) % k == 0
    new_a = (a*m + D*b) // abs(k)
    new_b = (a + b*m) // abs(k)
    new_k = (m*m - D) // k

    assert new_a*new_a - D*new_b*new_b == new_k
    return (new_a, new_b, new_k)

def get_minimal_x2(D):
    #starting values
    b = 1
    a = int(sqrt(D))+1
    k = a*a - D
    #iterate
    while k != 1:
        a,b,k = chakravala_iterate(a,b,k, D)
    return a

best_D = 0
best_x = 0
for i in range(2,1001):
    if not gmpy.is_square(i):
        x = get_minimal_x2(i)
        if x > best_x:
            best_x = x
            best_D = i
print(best_D)


