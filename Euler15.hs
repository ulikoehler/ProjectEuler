import Control.Monad.Memo

-- Num ways to build a length-n string of sum n from [0, 1]
numWays :: Int -> Int -> Int
numWays l n = startEvalMemo $ g' (l, n) where
    g' (len,0) = return 1 -- Only zeroes
    g' (1,n) = if n > 1 then return 0 else return 1
    g' (l,n) =
        if n > l
            then return 0
            else do
                a <- memo g' (l - 1, n - 1)
                b <- g' (l - 1, n)
                return $ a + b

numPaths n = numWays (2 * n) n

main = do
    print $ numPaths 20