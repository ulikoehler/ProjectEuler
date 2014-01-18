import Data.List
import Data.List.Split (splitOn)
import Data.Char (ord)

-- Remove quotes
fixName name = reverse $ drop 1 $ reverse $ drop 1 name

nameScore name = sum $ map (\x -> (ord x) - (ord 'A' - 1)) name

-- Multiply each value by their one-based index
multiplyByIndex lst = let lstLen = length lst 
                      in map (\ (x,y) -> x * y) $ zip lst [1..lstLen]

main = do
    names <- readFile "names.txt"
    let sortedNames = sort $ map fixName $ splitOn "," names
    let nameScores = map nameScore sortedNames
    print $ sum $ multiplyByIndex nameScores