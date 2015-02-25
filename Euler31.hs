

main :: IO ()
main = do
    -- Coin values in pounds
    let coins = [1, 2, 5, 10, 20, 50, 100, 200] :: [Int]
    -- What the result of the combination should be
    let targetValue = 200
    -- How many coins of one value form the target value
    let singleCoinMax = [targetValue `div` coin | coin <- coins] :: [Int]
    -- Brute-force all possibilities
    let combinations = sequence $ map (\n -> [1..n]) singleCoinMax
    let computeValue vals = sum $ map (uncurry (*)) $ zip vals coins
    let correctCombos = filter (\v -> targetValue == computeValue v) combinations
    print $ length correctCombos

