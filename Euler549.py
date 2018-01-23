from collections import Counter
from sympy import factorint
import gc

def factorial_coeffs(n):
    return list(range(0, n+1))

def factorial_factorization_up_to(n):
    ctr = Counter()
    for coeff in range(1, n+1):
        yield Counter(ctr)
        print(coeff)
        ctr += Counter(factorint(coeff))
        if coeff % 10000 == 0:
            gc.collect()
    yield ctr

def factorizable(fact1, fact2):
    for fact, multipl in fact1.items():
        if fact2[fact] < multipl:
            return False
    return True

#factortable = [factorial_factorization(n) for n in range(1000)]

factortable = list(factorial_factorization_up_to(45000))

def s(n):
    fact1 = factorint(n)
    for i, fact2 in enumerate(factortable):
        if factorizable(fact1, fact2):
            return i
    raise ValueError("Not enough: {}".format(n))

def S(n):
    return sum(s(i) for i in range(2,n+1))

print(S(100000))
