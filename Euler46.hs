import Math.NumberTheory.Primes.Sieve
import Math.NumberTheory.Primes.Testing

square x = x * x

testGB2 n =
    let relevantSquares = takeWhile (<=n) $ map square [1..]
        relevantPrimes = takeWhile (<=n) primes
        isGoldbach2List = [(a,b) | a <- relevantPrimes, b <- relevantSquares, n == a + 2*b]
    in (isPrime n) || (not.null $ take 1 isGoldbach2List)

main = do
    let baseNos = [3,5..]
    print $ take 1 $ filter (not . snd) $ zip baseNos $ map testGB2 baseNos