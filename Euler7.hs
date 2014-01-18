import Math.NumberTheory.Primes.Testing (isPrime)

nthPrime n = (filter isPrime [1..]) !! (n-1)

main = do
    print $ nthPrime 10001