import qualified Data.Set as Set

divisors n = filter ((==0) . rem n) [1..(n-1)]

d n = sum $ divisors n

isAmicable n = let da = d n
                   db = d da
               in if (db == n && da /= n)
                     then [n, da]
                     else []

uniq :: (Ord a) => [a] -> [a]
uniq lst = Set.toList (Set.fromList lst)

main = do
    let limit = 9999
    let amicableNumbers = uniq $ concat $ map isAmicable [0..limit]
    print $ sum $ amicableNumbers