import Math.NumberTheory.Primes.Testing (isPrime)
import Data.List

rotations xs =  map (\ x -> read x :: Integer) numericRotations where
            numericRotations = init (zipWith (++) (tails strXS) (inits strXS))
            strXS = show xs

isCircularPrime num = all isPrime (rotations num)

main = do
    let space = [0..1000000]
    print $ length $ filter isCircularPrime space