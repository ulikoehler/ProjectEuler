import Debug.Trace
import Data.List
import Numeric
import Data.Char (intToDigit)

tupleEq :: (Eq a0) => (a0, a0) -> Bool
tupleEq tp = (fst tp) == (snd tp)

isDecimalPalindrome :: Integer -> Bool
isDecimalPalindrome int = let lst = showIntAtBase 10 intToDigit int ""
                              palTuples = zip lst (reverse lst)
                          in all tupleEq palTuples

testLynchrel n = testLynchrelWorker n 50

testLynchrelWorker _ 0 = False
testLynchrelWorker n i = 
    let newN = n + (read . reverse . show) n
    in (isDecimalPalindrome newN || testLynchrelWorker newN (i-1))

main = do
    print $ (10000-) $ length $ filter testLynchrel [1..10000]