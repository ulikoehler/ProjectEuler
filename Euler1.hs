isMultipleOf3Or5 :: Integer -> Bool
isMultipleOf3Or5 num = let rem3 = num `rem` 3
                           rem5 = num `rem` 5
                       in (rem3 == 0 || rem5 == 0)

main = do
    print $ sum $ filter isMultipleOf3Or5 [1..999]