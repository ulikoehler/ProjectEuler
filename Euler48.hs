selfPower :: Integer -> Integer
selfPower n = n^n

main = do
    let limit = 1000
    let powerSum = sum $ map selfPower [1..limit]
    print $ powerSum