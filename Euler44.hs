{-# LANGUAGE UnicodeSyntax #-}

import Math.NumberTheory.Primes.Sieve
import Math.NumberTheory.Primes.Testing
import Data.IntSet (IntSet)
import qualified Data.IntSet as IntSet
import Data.IntSet.Unicode ((∈))

pentagonal n = (n*((3*n)-1)) `div` 2

tupleSum (a,b) = a+b
tupleDiffAbs (a,b) = abs (a-b)

main = do
    let base = [1..10000]
    let pentsList = map pentagonal base
    let pentsSet = IntSet.fromList $ pentsList
    let pentPairs = [(a,b) | a <- pentsList, b <- pentsList]
    let pentPairsZipped = zip (map tupleSum pentPairs) (map tupleDiffAbs pentPairs)
    let results = filter (\(a,b) -> (a ∈ pentsSet) && (b ∈ pentsSet)) pentPairsZipped
    print $ take 32 results