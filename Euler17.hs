import Text.Numeral.Grammar ( defaultInflection )
import qualified Text.Numeral.Language.ENG as EN
import Data.Maybe
import Data.List

-- Remove quotes
removeQuotes name = reverse $ drop 1 $ reverse $ drop 1 name

toword :: Integer -> String
toword num = removeQuotes $ show $ fromJust $ EN.gb_cardinal defaultInflection num

isSpecialChar c = (c == ' ' || c == '-')

filterSpecialChars :: String -> String
filterSpecialChars str = filter (not . isSpecialChar) str

countDistinctChars str = length $ nub $ sort str

main = do
    let space = [1..5000]
    print  $ toword 342