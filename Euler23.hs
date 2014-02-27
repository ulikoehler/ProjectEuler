import qualified Data.Set as Set
import Data.List ((\\))
import Data.List (nub)
import Math.NumberTheory.Primes.Factorisation

properDivisors :: Integer -> [Integer]
properDivisors n = Set.toList $ (divisors n) Set.\\ (Set.singleton n)

sumProperDivisors = sum . properDivisors

isAbundant n = sumProperDivisors n > n

main = do
    let abundantNumbers = filter isAbundant [1..28123]
    let sumAbundantNumbers = [x+y | x <- abundantNumbers, y <- abundantNumbers]
    let notAbundantSummable = nub $ [1..28123] \\ sumAbundantNumbers
    print $ sum $ notAbundantSummable