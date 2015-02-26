import Math.NumberTheory.Primes.Sieve
import Data.List
import Data.Maybe
import ClassyPrelude (ordNub)
import Control.Monad
import qualified Data.Set as Set

isPermutation :: Integer -> Integer -> Bool
isPermutation a b = sort (show a) == sort (show b)

foo :: [Integer] -> [(Integer, Integer, Integer)]
foo xs = [(a,b,c) | a <- xs, b <- xs, c <- xs, a /= b, b /= c, a /= c, b - a == c - b, a < b, b < c]

main :: IO ()
main = do
    let primes4Digit = takeWhile (< 10000) . dropWhile (< 1000) $ primes
    let primeSet = Set.fromList primes4Digit
    let perms n = Set.toList $ Set.intersection primeSet $ Set.fromList $ map read $ permutations $ show n
    let allPerms = map perms primes4Digit
    print $ ordNub $ sort $ concatMap foo allPerms
    