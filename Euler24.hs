import Data.List
import Numeric

main = do
    print $ (sort (permutations "0123456789")) !! 999999