import qualified Data.Vector as V
import Data.Vector (Vector, (!))
import Data.Char (ord)
import Math.Combinatorics.Exact.Factorial
import qualified Data.Set as Set
import Data.Set (Set)

takeUntilDuplicateSet :: (Eq a, Ord a) => [a] -> Set a
takeUntilDuplicateSet = helper Set.empty
    where helper seenSet [] = seenSet
          helper seenSet (x:xs)
              | x `Set.member` seenSet = seenSet
              | otherwise = helper (Set.insert x seenSet) xs

digits :: (Integral a, Show a) => a -> [Int]
digits i =
    let charCodes = map ord $ show i
        code0 = ord '0' :: Int
    in map (\n -> n - code0) charCodes

factorials :: Vector Integer
factorials =
    let nums = [0..10]
        intFactorials = map factorial nums
    in V.fromList intFactorials

digitFactorialSum :: Integer -> Integer
digitFactorialSum i =
    let facs = map (\n -> factorials ! n) $ digits i
    in sum facs

digitFactorialChainWorker :: Integer -> [Integer]
digitFactorialChainWorker i =
    let facsum = digitFactorialSum i
    in facsum : digitFactorialChainWorker facsum


digitFactorialChain :: Integer -> [Integer]
digitFactorialChain i = i : digitFactorialChainWorker i

takeUntilDuplicate :: Eq a => [a] -> [a]
takeUntilDuplicate = helper []
    where helper seen [] = seen
          helper seen (x:xs)
              | x `elem` seen = seen
              | otherwise = helper (seen ++ [x]) xs

digitFactorialChainLength :: Integer -> Int
digitFactorialChainLength = Set.size . takeUntilDuplicateSet . digitFactorialChain

main :: IO ()
main =
    print $ length $ filter (== 60) $ map digitFactorialChainLength [1..999999]