#!/usr/bin/env python3
import math

tolerance = 0.00001

n = 50
cnt = 0
# Iterate p
for x1 in range(n + 1):
    for y1 in range(n + 1):
        # Iterate Q
        for x2 in range(n + 1):
            for y2 in range(n + 1):
                # Zero size rectangle
                if x1 == x2 and y1 == y2:
                    continue
                # R is (0,0)
                a = math.sqrt(x1**2 + y1**2) #RP
                b = math.sqrt((x2 - x1)**2 + (y2 - y1)**2) #PQ
                c = math.sqrt(x2**2 + y2**2) #RQ
                if a < tolerance or b < tolerance or c < tolerance:
                    continue #zero length side
                #print(a,b,c)
                #print((c**2 + a**2 - b**2))
                #print((2 * c * a))
                #print((c**2 + a**2 - b**2) / (2 * c * a))
                xa = (b**2 + c**2 - a**2) / (2 * b * c)
                xb = (c**2 + a**2 - b**2) / (2 * c * a)
                # Clamp due to floating point errors
                xa = max(-1.0, min(xa, 1.0))
                xb = max(-1.0, min(xb, 1.0))
                alpha = math.degrees(math.acos(xa))
                beta = math.degrees(math.acos(xb))
                gamma = 180.0 - (alpha + beta)

                if abs(alpha - 90.0) < tolerance or abs(beta - 90.0) < tolerance or abs(gamma - 90.0) < tolerance:
                    cnt += 1
print(cnt // 2)
