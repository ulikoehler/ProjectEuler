#!/usr/bin/env python3
from num2words import num2words

def filterLetters(s):
    return filter(lambda c: c != " " and c != "-", s)

def numLetters(n):
    return sum(1 for x in filterLetters(num2words(n)))

if __name__ == "__main__":
    print(sum(numLetters(n) for n in range(1, 1001)))
    #for i in range(1, 1001):
    #    print(num2words(i))
