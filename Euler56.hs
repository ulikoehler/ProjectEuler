

digitSum num = sum $ map (\x -> read [x] :: Integer) (show num)

srcspace = [1..100]
expspace = [a ^ b | a <- srcspace, b <- srcspace]

main = do
    print $ maximum $ map digitSum expspace
