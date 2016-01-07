import qualified Data.Set as Set

numSpace = [2..100] :: [Integer]

l = Set.size $ Set.fromList $ [a ^ b | a <- numSpace, b <- numSpace]

main = do
    print $ l