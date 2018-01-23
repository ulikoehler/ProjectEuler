#!/usr/bin/env python3
from fractions import Fraction

def ndigits(n):
    return len(str(n))

def is_numdigits_larger_than_dendigits(frac):
    return ndigits(frac.numerator) > ndigits(frac.denominator)

def expansion(n):
    f = 2 + Fraction(1, 2)
    for i in range(n):
        f = 2 + Fraction(1, f)
    return 1 + Fraction(1, f)

#f3 = Fraction(2 + Fr)
expansions = [expansion(n) for n in range(1000)]
print(sum(is_numdigits_larger_than_dendigits(exp) for exp in expansions))
