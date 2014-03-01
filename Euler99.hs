{-# LANGUAGE BangPatterns, UnicodeSyntax #-}
import Math.NumberTheory.Primes.Sieve
import Math.NumberTheory.Primes.Testing
import Math.NumberTheory.Primes.Factorisation
import Data.Set (Set)
import qualified Data.Set as Set
import Control.Applicative
import Data.List.Split
import Control.Lens

import Data.IntMap (IntMap)
import qualified Data.IntMap as IntMap

parseLine :: String -> (Integer, Integer)
parseLine str =
    let lst = map (read :: String -> Integer) $ splitOn "," str
        a = head lst
        b = head $ tail lst
    in (a,b)

-- Factorize and multiply each number by exponent
--  --> Get sum of powers equivalent to original power, but with smaller bases
primeFactExp :: (Integer, Integer) -> IntMap Int
primeFactExp (a,b) =
    let facts = factorise a
        b' = fromIntegral b :: Int
        finalFactors = map (over _1 fromIntegral) $ map (over _2 (* b')) facts
    in IntMap.fromList finalFactors

substract = IntMap.unionWith (-)

-- TODO TODO TODO

main = do
    baseExpLines <- lines <$> readFile "base_exp.txt"
    let x = primeFactExp $ parseLine $ head $ take 1 baseExpLines
    print $ x'