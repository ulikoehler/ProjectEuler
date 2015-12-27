{-# LANGUAGE NoImplicitPrelude #-}
import Prelude hiding ((//))
import Fraction
import qualified Data.Set as S

space = [1..1000000]
fractions = S.fromList [a // b | a <- space, b <- space, a < b]

main = do
    print $ S.size fractions
