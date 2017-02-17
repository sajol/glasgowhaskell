
myTail :: [a] -> [a]
myTail [] = []
myTail (_ : xs) = xs

myHead :: [a] -> a
myHead (x : _) = x

--handle with Maybe data type
mySafeTail :: [a] -> Maybe [a]
mySafeTail [] = Nothing
mySafeTail (_ : []) = Nothing
mySafeTail (_ : xs) = Just xs

mySafeHead :: [a] -> Maybe a
mySafeHead [] = Nothing
mySafeHead (x : _) = Just x


--write your own myEnumFromTo
myEnumFromTo :: (Enum a, Ord a) => a -> a -> [a]
myEnumFromTo a b
    | a > b = []
    | otherwise = buildList a b []
    where
        buildList from to accumulator
            | from > to = accumulator
            | from <= to = buildList (succ from) to (accumulator ++ [from])