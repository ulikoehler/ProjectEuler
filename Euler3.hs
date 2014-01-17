import Math.NumberTheory.Primes.Factorisation (factorise)

main = do
    let factors = factorise 600851475143
    print $ (fst . last) factors