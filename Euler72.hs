{-# LANGUAGE NoImplicitPrelude #-}
import Math.Sieve.Phi
import Prelude hiding ((//))
import Fraction
import qualified Data.Set as S

stop = 1000000
space = [2..stop]
numReducedFractions =
    let sv = sieve stop
    in sum [phi sv a | a <- space]

main = do
    print $ numReducedFractions
