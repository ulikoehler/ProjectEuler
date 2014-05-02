
import qualified Data.Set as Set
import Data.Set (Set, (\\))

type DigitSet = Set Char

digitsEqual :: Int -> Int -> Bool
digitsEqual a b =
    let left = Set.null $ toDigitSet a \\ toDigitSet b
        right = Set.null $ toDigitSet b \\ toDigitSet a
    in left && right

toDigitSet :: Int -> DigitSet
toDigitSet n = Set.fromList $ show n

digitsEqual2x n = digitsEqual n (2*n)
digitsEqual23456x n =
    digitsEqual n (2*n)
        && digitsEqual n (3*n)
        && digitsEqual n (4*n)
        && digitsEqual n (5*n)
        && digitsEqual n (6*n)

main = do
    let numOfInterest = head . filter digitsEqual23456x $ [1..]
    print numOfInterest
