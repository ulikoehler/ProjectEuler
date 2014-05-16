
import qualified Data.ByteString.Char8 as B

import Data.Int
import Data.Char (ord, chr, isSymbol)
import Data.Bits
import Data.List (cycle, minimumBy)

chars = ['a'..'z']
keys = [[ord a, ord b, ord c] | a <- chars, b <- chars, c <- chars] :: [[Int]]

decrypt :: [Int] -> [Int] -> String
decrypt ct key =
    map (chr . uncurry xor) $ zip ct $ cycle key

penalty :: String -> Int
penalty = length . filter isSymbol

findBestDecryptions :: [Int] -> String
findBestDecryptions ct =
    let allPlaintexts = map (decrypt ct) keys :: [String]
    in minimumBy (\a b -> compare (penalty a) (penalty b)) allPlaintexts

sumOfASCIIChars :: String -> Int
sumOfASCIIChars = sum . map ord

main = do
    dat <- B.readFile "cipher1.txt"
    let ct = map read $ map B.unpack $ B.split ',' dat :: [Int]
    print $ sumOfASCIIChars $ findBestDecryptions ct