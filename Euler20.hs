digitSum num = sum $ map (\x -> read [x] :: Integer) (show num)

factorial 0 = 1
factorial n = n * factorial (n - 1)

main = do
    print $ digitSum $ factorial 100