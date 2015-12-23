numDigits :: (Show a) => a -> Integer
numDigits = fromIntegral . length . show

expSpace = [1..1000] :: [Integer]

-- 2 element tuple functions
t2eq (a, b) = (a == b)
t2lt (a, b) = a < b
t2lteq (a, b) = a <= b
t2gt (a, b) = a > b
t2gteq (a, b) = a >= b

numMatchingNumbers base =
    let exps = map (base ^) expSpace
        expNumDigits = zip expSpace $ map numDigits exps
        -- Take from expNumDigits until digits > l
        relevants = takeWhile t2gteq expNumDigits
        filtered = filter t2eq expNumDigits
    in length filtered

main :: IO ()
main = do
    let baseSpace = [1..100]
    print $ sum $ map foo baseSpace