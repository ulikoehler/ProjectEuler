#!/usr/bin/env python3
# use that if the fraction is representable as i/999999 it has len("999999") recurring digits
nines = [int("9" * i) for i in range(1, 5000)]

def find_least_ninemult():
    for d in range(1, 1000):
        for nineMult in nines:
            if nineMult % d == 0:
                yield( d, len(str(nineMult)))
                break

results = list(find_least_ninemult())
print(max(results, key=lambda r: r[1]))
    