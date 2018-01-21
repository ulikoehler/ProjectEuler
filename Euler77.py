#!/usr/bin/env python3
import gmpy2
import itertools

def primes(start=1):
    n = start
    while True:
        n = gmpy2.next_prime(n)
        yield int(n)

def primes_below(n):
    ret = []
    for prime in primes():
        if prime >= n:
            break
        ret.append(prime)
    return ret

# See https://www.geeksforgeeks.org/dynamic-programming-set-7-coin-change/
def count(S, m, n):
    table = [[0 for x in range(m)] for x in range(n + 1)]
    for i in range(m):
        table[0][i] = 1
    for i in range(1, n + 1):
        for j in range(m):
            x = table[i - S[j]][j] if i - S[j] >= 0 else 0
            y = table[i][j - 1] if j >= 1 else 0
            table[i][j] = x + y
    return table[n][m - 1]

def r(n):
    arr = primes_below(n)
    m = len(arr)
    return count(arr, m, n)

for i in range(10,10000000):
    rx = r(i)
    if rx > 5000:
        print(i, r(i))
        break
