import Math.NumberTheory.Powers.Squares (isSquare)
import Control.Parallel.Strategies

type Triangle = (Integer, Integer, Integer)

perimeter :: Triangle -> Integer
perimeter (a, b, c) = a + b + c

isAlmostEquilateral :: Triangle -> Bool
isAlmostEquilateral t@(a, b, c) =
    let s2 = perimeter t -- Two times s
        s = s2 `quot` 2
        v = s*(s-a)*(s-b)*(s-c)
    in (s * 2 == s2) && (isSquare v)

limit = 1000000000 :: Integer
genTriangles a = [(a, a, (a-1)), (a, a, (a+1))] :: [Triangle]
-- Even a's always generate odd perimeters
allTriangles = concatMap genTriangles [3,5..] :: [Triangle]
relevantTriangles = takeWhile ((>=) limit . perimeter) allTriangles :: [Triangle]

parFilter :: Strategy Bool -> (a -> Bool) -> [a] -> [a]
parFilter strat fn lst =
    let boolList = parMap strat fn lst :: [Bool]
    in map fst $ filter snd $ zip lst boolList

main = do
    let aeTriangles = parFilter rdeepseq isAlmostEquilateral $ relevantTriangles
    print $ sum $ map perimeter $ aeTriangles
    print $ aeTriangles