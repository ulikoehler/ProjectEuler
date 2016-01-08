import Math.NumberTheory.Primes
import Control.GroupWith
import Data.List
import qualified Data.Map as M

nDigits :: Integer -> Int
nDigits n = length $ show n

myPrimes = filter ((== 5) . nDigits) $ take 100000 primes
mp = filter (not . null) . subsequences . show
x = groupWithMultiple mp myPrimes

main = do
    --print $ length myPrimes
    print x