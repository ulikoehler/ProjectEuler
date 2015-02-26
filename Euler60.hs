import Math.NumberTheory.Primes.Sieve
import Math.NumberTheory.Primes.Testing
import qualified Data.MultiMap as MM
import Data.Maybe
import Control.Applicative
import ClassyPrelude (ordNub)
import Data.Map (Map)
import Data.Set (Set)
import Data.List
import Data.Ord
import qualified Data.Map as Map
import qualified Data.Set as Set

type I3 = (Integer, Integer, Integer)
type I4 = (Integer, Integer, Integer, Integer)
type I5 = (Integer, Integer, Integer, Integer, Integer)

-- Test for the Euler 60 special property
isConcatenableToPrime :: Integer -> Integer -> Bool
isConcatenableToPrime a b =
    let ab = read (show a ++ show b)
        ba = read (show b ++ show a)
    in isPrime ab && isPrime ba

isElemOfValue :: (Ord b, Ord a) => Map a (Set b) -> a -> b -> Bool
isElemOfValue m k v = fromMaybe False $ Set.member v <$> Map.lookup k m

checkTriple :: Map Integer (Set Integer) -> Integer -> [I3]
checkTriple m key =
    let values = fromMaybe [] $ Set.toList <$> Map.lookup key m
    in [(key, a, b) | a <- values, b <- values, a < b, isElemOfValue m a b]

checkQuadruple :: Map Integer (Set Integer) -> I3 -> [I4]
checkQuadruple m (a,b,c) =
    let values k = fromMaybe Set.empty $ Map.lookup k m
        allValues = map values [a,b,c]
        intersect = Set.toList $ foldr1 Set.intersection allValues
    in [(a,b,c,d) | d <- intersect, d `notElem` [a,b,c]]

checkQuintuple :: Map Integer (Set Integer) -> I4 -> [I5]
checkQuintuple m (a,b,c,d) =
    let values k = fromMaybe Set.empty $ Map.lookup k m
        allValues = map values [a,b,c,d]
        intersect = Set.toList $ foldr1 Set.intersection allValues
    in [(a,b,c,d,e) | e <- intersect, e `notElem` [a,b,c,d]]


main :: IO ()
main = do
    let primesOfInterest = take 2000 primes
    let primeCombos = [(a, b) | a <- primesOfInterest, b <- primesOfInterest, a < b]
    let mm = MM.toMapOfSets $ MM.fromList $ filter (uncurry isConcatenableToPrime) primeCombos
    let computeNary f input = ordNub $ concatMap (f mm) input
    let triples = computeNary checkTriple $ Map.keys mm
    let quadruples = computeNary checkQuadruple triples
    -- This should be (3,7,109,673) as outlined in the task
    let minQuadruple = minimumBy (comparing (\(a,b,c,d) -> a+b+c+d)) quadruples
    -- Actual quintuple computation
    let quintuples = ordNub $ concatMap (checkQuintuple mm) quadruples
    let minQuintuple = minimumBy (comparing (\(a,b,c,d,e) -> a+b+c+d+e)) quintuples
    -- Print quintuple and sum
    --print minQuadruple
    print minQuintuple
    print $ (\(a,b,c,d,e) -> a+b+c+d+e) minQuintuple
