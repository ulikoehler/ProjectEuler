import Data.List
import Numeric
import Data.Char (intToDigit)

factorial 0 = 1
factorial n = n * factorial (n - 1)

getdigits num = map (\x -> read [x] :: Int) (show num)

digitfactorialsum str = sum $ map factorial $ getdigits str

checkFactorialsum num = let factorialsum = digitfactorialsum num
                        in if factorialsum == num
                           then if (num /= 1 && num /= 2)
                              then [num]
                              else []
                           else []

main = do
    let space = [0..1000000]
    print $ sum $ concat $ map checkFactorialsum space