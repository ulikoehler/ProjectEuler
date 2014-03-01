import Data.Number.BigFloat

type Prec70 = PrecPlus20 Prec50
type Prec90 = PrecPlus20 Prec70
type Prec110 = PrecPlus20 Prec90
type Prec130 = PrecPlus20 Prec110
type X = BigFloat Prec130

xsqrt :: Int -> X
xsqrt x = sqrt (fromIntegral x)

xsqrSum x =
    let f = take 100 $ drop 2 (show $ xsqrt x)
    in (map (\ x -> (read [x] :: Int)) f)


main = do
    print $ sum $ xsqrSum 2