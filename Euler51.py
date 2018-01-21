#!/usr/bin/env python3
import gmpy2
import itertools

def primes(start=2):
    n = start
    while True:
        n = gmpy2.next_prime(n)
        yield n

replaceDigits = "1234567890"

def try_replace(s, idxs, dbg=False):
    count = 0 # num primes
    #print(s, idxs)
    primes = set()
    for d in replaceDigits:
        # Replace. strs are immutable
        sl = list(s)
        for i in idxs:
            sl[i] = d
        # Must not make number shorter
        if sl[0] == "0":
            continue
        # Check primeness
        num = int("".join(sl))
        if gmpy2.is_prime(num):
            primes.add(num)
    if dbg:
        print(" primes ", primes)
    return len(primes)

def try_all_combinations(prime, dbg=False):
    s = str(prime)
    idxs = list(range(len(s)))
    maxCnt = 0
    for i in range(1, len(s) - 1):
        #print([try_replace(s, comb) for comb in itertools.combinations(idxs, i)])
        localMax = max(try_replace(s, comb, dbg) for comb in itertools.combinations(idxs, i))
        #print(i, localMax)
        maxCnt = max(localMax, maxCnt)
    return maxCnt




for prime in primes():
    combos = try_all_combinations(prime)
    #print(prime, combos)
    #if prime == 13:
    #    break
    if combos == 8:
        print("YESSSSSSSSSSSSSSSSs", prime)
        try_all_combinations(prime, dbg=True)
