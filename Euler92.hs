import qualified Data.Set as Set
import Data.List.Utils (contains)

square n = n*n

numberChainGen num = [num] ++ numberChain(nextval) where
                    nextval = digitSquareSum num
numberChainWorker num haveSeenStop = let cont = digitSquareSum num
                                     in if (cont == 89 || cont == 1)
                                            then if haveSeenStop
                                                    then [num, cont]
                                                    else [num] ++ (numberChainWorker cont True)
                                            else [num] ++ (numberChainWorker cont haveSeenStop)
numberChain num = numberChainWorker num False

digitSquareSum num = sum $ map square $ map (\x -> read [x] :: Int) (show num)
    
lastNumberChain num = last $ numberChain num
    
main = do
    let space = [1..10000000]
    print $ length $ filter (==89) $ map lastNumberChain space