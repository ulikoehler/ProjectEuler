import Data.List
import Numeric
import Math.NumberTheory.Primes.Testing (isPrime)

pandigitals n = let pandigitalStrs = permutations $ take n "123456789"
                in map (\x -> read x:: Integer) pandigitalStrs

pandigitalsUpTo n = concat $ map pandigitals [1..n]

main = do
    let pandigitalNumbers = pandigitalsUpTo 9
    let pandigitalPrimes = filter isPrime pandigitalNumbers
    print $ maximum $ pandigitalPrimes