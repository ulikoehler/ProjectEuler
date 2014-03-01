import Data.Array.Repa hiding (map)
import Debug.Trace
import Data.List.Split

matRaw :: [Int]
matRaw = [131, 673, 234, 103, 18,
            201, 96 , 342, 965, 150,
            630, 803, 746, 422, 111,
            537, 699, 497, 121, 956,
            805, 732, 524, 37 , 331]

data Direction = DirUp | DirLeft deriving (Show)

getDirection _   0 y = DirUp
getDirection _   x 0 = DirLeft
getDirection mat x y =
    let val = mat ! (ix2 x y)
        valUp = mat ! (ix2 x (y-1))
        valLeft = mat ! (ix2 (x-1) y)
    in if valUp <= valLeft then DirUp else DirLeft

getSum mat 0 0 = mat ! (ix2 0 0)
getSum mat x y =
    let dir = getDirection mat x y
        val = mat ! (ix2 x y)
        val' = traceShow (val,dir) val
    in case dir of DirUp -> val' + (getSum mat x (y-1))
                   DirLeft -> val' + (getSum mat (x-1) y)

main = do
    fileContent <- readFile "81.txt"
    let list = concatMap ((map read) . splitOn ",") $ lines fileContent :: [Int]
    let mat = fromListUnboxed (ix2 80 80) list
    -- print $ map ((map (read :: String -> Int)) . splitOn ",") $ lines fileContent
    print $ getSum mat 79 79