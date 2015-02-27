
main = do
    let diameter = 1001
    -- First circle: 1 difference between diagonal numbers, second: 3, ...
    let differenceList = takeWhile(< diameter) [2,4..]
    -- Always 4 numbers per circle
    let allDifferences = concatMap (replicate 4) differenceList
    print $ sum $ scanl (+) 1 allDifferences
