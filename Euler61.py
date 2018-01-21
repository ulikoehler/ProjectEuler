import itertools

def triangle():
    i = 0
    while True:
        yield i * (i + 1) // 2  
        i += 1

def square():
    i = 0
    while True:
        yield i * i
        i += 1

def pentagonal():
    i = 0
    while True:
        yield i * (3*i - 1) // 2
        i += 1

def hexagonal():
    i = 0
    while True:
        yield i * (2 * i - 1)
        i += 1

def heptagonal():
    i = 0
    while True:
        yield i * (5 * i - 3) // 2
        i += 1

def octagonal():
    i = 0
    while True:
        yield i * (3 * i - 2)
        i += 1

def four_digits(gen):
    nums = []
    for num in gen:
        if num >= 10000:
            break
        if num >= 1000:
            nums.append(num)
    return nums

def split_digits(num):
    s = str(num)
    return (s[:2], s[2:])

triangle4 = four_digits(triangle())
square4 = four_digits(square())
pentagonal4 = four_digits(pentagonal())
hexagonal4 = four_digits(hexagonal())
heptagonal4 = four_digits(heptagonal())
octagonal4 = four_digits(octagonal())



#print(len(triangle4) * len(square4) * len(pentagonal4) * len(hexagonal4) * len(heptagonal4) * len(octagonal4))
