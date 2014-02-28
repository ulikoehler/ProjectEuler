import Math.NumberTheory.Primes.Sieve
import Math.NumberTheory.Primes.Testing
import Data.IntSet (IntSet)
import qualified Data.IntSet as IntSet
triangle n = (n*(n+1)) `div` 2
    
pentagonal n = (n*((3*n)-1)) `div` 2

hexagonal n = n*((2*n)-1)

main = do
    let base = [1..100000]
    let triangles = IntSet.fromList $ map triangle base
    let pentagonals = IntSet.fromList $ map pentagonal base
    let hexagonals = IntSet.fromList $ map hexagonal base
    let intersect = IntSet.intersection pentagonals $ IntSet.intersection hexagonals triangles
    print $ take 1 $ dropWhile (<= 40755) $ IntSet.toList $ intersect