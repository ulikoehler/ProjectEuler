import Math.NumberTheory.Primes.Testing (isPrime)
 
main = do
    let limit = 2000000
    let primes = filter isPrime [1..limit]
    let primeSum = sum primes
    print primeSum