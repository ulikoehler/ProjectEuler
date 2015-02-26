import Math.NumberTheory.Logarithms
import Debug.Trace

digitSum num = sum $ map (\x -> read [x] :: Integer) (show num)

isInA :: Integer -> Bool
isInA n =
    let logV = integerLogBase ds n
        ds = digitSum n
    in fromIntegral (ds ^ logV) == n

main :: IO ()
main = do
    print $ take 30 $ filter isInA [10..]
