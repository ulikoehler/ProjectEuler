import Data.Time

allWeeks startDay endDay = let nextDay = addDays 7 startDay
                           in if diffDays nextDay endDay >= 0
                                  then []
                                  else [nextDay] ++ (allWeeks nextDay endDay)

isFirstDayOfMonth day = let (y,m,d) = toGregorian day
                        in d == 1
                                  
main = do
    let startDay = fromGregorian 1899 31 31
    let endDay = fromGregorian 2001 1 1
    print $ length $ filter isFirstDayOfMonth $ allWeeks startDay endDay