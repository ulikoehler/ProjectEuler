import Data.List
import Data.Char (ord)
import Numeric
import Data.List.Split (splitOn)
import Math.NumberTheory.Primes.Testing (isPrime)

-- Remove quotes at the beginning and the end of a string
removeQuotes name = reverse $ drop 1 $ reverse $ drop 1 name

triangleNumbers :: [Integer]
triangleNumbers = triangleWorker (1::Integer) (0::Integer)
triangleWorker :: Integer -> Integer -> [Integer]
triangleWorker n lastval = let current = n + lastval
                           in [current] ++ triangleWorker (n + 1) current

wordToNum :: String -> Integer
wordToNum word = sum $ map (\x -> toInteger((ord x) - (ord 'A' - 1))) word

isTriangleNumber n = let filtered = head $ filter (\x -> x >= n) triangleNumbers
                     in (filtered == n)

main = do
    fileContent <- readFile "words.txt"
    let theWords = map removeQuotes $ splitOn "," fileContent
    print $ length $ filter (isTriangleNumber . wordToNum) theWords
    