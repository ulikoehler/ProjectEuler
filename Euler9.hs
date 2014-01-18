import Data.Char (isSpace)

isPythagoreanTriplet (a, b, c) = ((a * a) + (b * b) == (c * c))

tripletSum (a, b, c) = a + b + c
tripletProd (a, b, c) = a * b * c

-- 2 ties Cartesian product with itself
cartTripleProd lst = [(x, y, z) | x <- lst, y <- lst, z <- lst]

main = do
    let nums = [1..500]
    let triplets = filter isPythagoreanTriplet $ cartTripleProd nums
    let tripletOfInterest = head $ filter ((== 1000) . tripletSum) $ triplets
    print $ tripletProd tripletOfInterest