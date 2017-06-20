#!/usr/bin/env python3
'''
A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
'''
best=0
for s in range(999*2, 100*2, -1):
    if best > (s/2)**2:
        break
    for num1 in range(s-999,1000):
        num2 = s - num1
        string = str(int(num1*num2))
        if string == string[::-1] and best < num1*num2:
            best = num1*num2
print(best)
