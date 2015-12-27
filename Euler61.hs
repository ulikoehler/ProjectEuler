import Control.GroupWith
import qualified Data.Set as S
import qualified Data.Map as M
import Data.Maybe

triangle n = n * (n+1) `div` 2
square n = n * n
pentagonal n = n * (3*n-1) `div` 2
hexagonal n = n * (2*n - 1)
heptagonal n = n * (5*n - 3) `div` 2
octagonal n = n * (3 * n - 2)

triangles = map triangle [1..]
squares = map square [1..]
pentagonals = map pentagonal [1..]
hexagonals = map hexagonal [1..]
heptagonals = map heptagonal [1..]
octagonals = map octagonal [1..]

polygonals4digits =
    concat $ map only4Digits [triangles, squares, pentagonals, hexagonals, octagonals]

numDigits :: Integer -> Int
numDigits = length . show

only4Digits :: [Integer] -> [Integer]
only4Digits =
    let predicate = ((== 4) . numDigits)
    in takeWhile predicate . dropWhile (not . predicate)

first2Of4, last2Of4 :: Integer -> Integer
first2Of4 = read . take 2 . show
last2Of4 = read . drop 2 . show

foo =
    let lastDigitMap = groupWith last2Of4 polygonals4digits
        firstDigitMap = groupWith first2Of4 polygonals4digits
        pairs = [(a,b) | a <- polygonals4digits,
                         b <- fromMaybe [] (M.lookup (last2Of4 a) firstDigitMap)]
        pairsFstSet = S.fromList $ map fst pairs
        pairsSndSet = S.fromList $ map snd pairs
        -- Find pairs whose second element also has a partner
        pairsWithPartner = filter (\(_,b) -> S.member b pairsFstSet && ) pairs
    in pairsWithPartner

main = do
    print $ length foo
