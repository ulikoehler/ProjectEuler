#!/usr/bin/env python3
import numpy as np
import fractions

def t(k):
    # wolfram alpha: solve 4^t=2^t+k for t:
    return np.log(0.5*(np.sqrt(4*k+1) + 1))/np.log(2)

def isnat(n):
    return np.abs(n - np.rint(n)) < 1e-6

ns = np.arange(1,1000000+1)
ts = t(ns)
isvalid = isnat(4**ts)
isint = isnat(ts)

def P(m):
    return fractions.Fraction(np.sum(isint[:m]), np.sum(isvalid[:m]))

#print(P(5))
#print(P(10))
#print(P(15))
#print(P(20))
#print(P(25))
#print(P(30))
#print(P(180))
#print(P(185))


for m in range(2, 1000000):
    if P(m) < fractions.Fraction(1,1234567):
        print("Result",m)
    if m % 100000 == 0:
        print(m)
