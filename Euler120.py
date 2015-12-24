#!/usr/bin/env python3
from concurrent.futures import ProcessPoolExecutor

def formula(a, n):
    v = (a-1)**n + (a+1)**n
    return v % (a*a)

def maxR(a, lim=10000):
    return max(formula(a, i) for i in range(lim + 1))

if __name__ == "__main__":
    executor = ProcessPoolExecutor(12)
    results = executor.map(maxR, range(999, 1001))
    print(sum(results))