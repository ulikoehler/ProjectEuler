#!/usr/bin/env python3
from collections import namedtuple

Point = namedtuple("Point", ["x", "y"])

def isInTriangle(p1, p2, p3, p):
    a = ((p2.y - p3.y) * (p.x - p3.x) + (p3.x - p2.x) * (p.y - p3.y)) / ((p2.y - p3.y)*(p1.x - p3.x) + (p3.x - p2.x)*(p1.y - p3.y))
    b = ((p3.y - p1.y) * (p.x - p3.x) + (p1.x - p3.x) * (p.y - p3.y)) / ((p2.y - p3.y)*(p1.x - p3.x) + (p3.x - p2.x)*(p1.y - p3.y))
    c = 1 - a - b
    return 0 <= a <= 1 and 0 <= b <= 1 and 0 <= c <= 1

def parseTrianglesFile():
    with open("p102_triangles.txt") as infile:
        for line in infile:
            ax, ay, bx, by, cx, cy = tuple(map(float, line.split(",")))
            yield (Point(ax, ay), Point(bx, by), Point(cx, cy))

if __name__ == "__main__":
    origin = Point(0,0)
    # Validation
    #a, b, c = Point(-340.0, 495.0), Point(-153.0, -910.0), Point(835.0, -947.0)
    #x, y, z = Point(-175.0, 41.0), Point(-421.0, -714.0), Point(574.0, -645.0)
    #print(isInTriangle(a, b, c, origin))
    #print(isInTriangle(x, y, z, origin))
    print(sum(isInTriangle(a, b, c, origin) for a,b,c in parseTrianglesFile()))
