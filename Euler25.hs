fibs = scanl (+) 0 (1:fibs)

countDigits num = length (show num)

main = do
    let limit = 1000
    let fibsWithIdx = zip [0..] fibs :: [(Integer, Integer)]
    let filteredFibs = map fst $ filter ((>= limit) . countDigits . snd) $ fibsWithIdx
    print $ head $ filteredFibs