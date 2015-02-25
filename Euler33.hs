{-# LANGUAGE UnicodeSyntax #-}
import Data.Ratio
import Control.Monad
import Data.List ((\\), intersect)
import Debug.Trace (traceShow)
type Rational = (Int, Int)

-- Cancel how an inexperienced mathematician would cancel
inexperiencedCancel :: Int -> Int -> Ratio Int
inexperiencedCancel a b =
    let astr = show a
        bstr = show b
        a' = read (astr \\ bstr)
        b' = read (bstr \\ astr)
    in a' % b'
    
-- Is the fraction trivially cancellable, e.g. 30/50 or 1/11
-- Might need modifications for numbers > 99
isTrivial :: Int -> Int -> Bool
isTrivial a b =
    let astr = show a
        bstr = show b
        -- Cancelling must NOT remove all digits of num/den
        anull = null (astr \\ bstr)
        bnull = null (bstr \\ astr)
        -- Cancelling must remove some digits
        intersectNull = null $ intersect astr bstr
    in '0' `elem` (show a) || '0' `elem` (show b)
        || (a == b) || anull || bnull || intersectNull

-- Check if a fraction is 'curious' according to Project Euler problem 33
checkFraction :: Int -> Int -> Bool
checkFraction a b
    | isTrivial a b = False
    | a > b = False -- Fraction must be less than one
    | inexperiencedCancel a b == a % b = True
    | otherwise = False

main :: IO ()
main = do
    -- Define the search space
    let space = [(a, b) | a <- [1..99], b <- [1..99]]
    -- Compute the four fractions of interest
    let resultingFractions = filter (uncurry checkFraction) space
    -- Compute product
    let fractProduct = product $ map (uncurry (%)) resultingFractions
    -- Print the denominator
    print $ denominator fractProduct
    