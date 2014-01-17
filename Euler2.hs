fibs = scanl (+) 0 (1:fibs)

main = do
    let numbers = takeWhile (<4000000) $ filter even fibs
    print $ sum numbers