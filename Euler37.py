#!/usr/bin/env python3
import gmpy2

def primes(start=2):
    n = start
    while True:
        n = gmpy2.next_prime(n)
        yield n

def is_leftright_truncatable(prime):
    s = str(prime)
    left_truncatable = all((gmpy2.is_prime(int(s[i:])) for i in range(1, len(s))))
    right_truncatable = all((gmpy2.is_prime(int(s[:i])) for i in range(1, len(s))))
    return left_truncatable and right_truncatable

p = primes(8) # avoid 2, 3, 5 and 7
left = 11 # see problem description
psum = 0 # result
while True:
    prime = next(p)
    if is_leftright_truncatable(prime):
        psum += prime
        left -= 1
        if left <= 0:
            break
print(psum)
