digitSum num = sum $ map (\x -> read [x] :: Int) (show num)

main = do
    print $ digitSum (2^1000)