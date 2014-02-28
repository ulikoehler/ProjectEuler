
champernowne :: String
champernowne =
    let cnext n = (show n) ++ cnext (n+1)
    in cnext 1

main = do
    print $ take 50 champernowne