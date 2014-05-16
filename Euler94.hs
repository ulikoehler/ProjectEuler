

data Triangle = Triangle Integer Integer Integer deriving (Show)

perimeter :: Triangle -> Integer
perimeter (Triangle a b c) = a + b + c

isSquare n = sq * sq == n
    where sq = floor $ sqrt $ (fromIntegral n :: Double)

isAlmostEquilateral t@(Triangle a b c) =
    let p = perim `div` 2
        perim = perimeter t
    in even perim && isSquare (p * (p - a) * (p - b) * (p - c))

limit = 1000000000 :: Integer

genTriangles a = [Triangle a a (a-1), Triangle a a (a+1)]

allTriangles =
    concatMap genTriangles [1..]

relevantTriangles = takeWhile ((>=) limit . perimeter) allTriangles

main = do
    let aeTriangles = filter isAlmostEquilateral $ relevantTriangles
    print $ sum $ map perimeter $ aeTriangles