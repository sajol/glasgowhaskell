
oddList :: [Int] -> [Int]
oddList [] = []
oddList (x:xs)
    | odd x = x : oddList xs
    | otherwise = oddList xs

evenList :: [Int] -> [Int]
evenList [] = []
evenList (x:xs)
    | even x = x : evenList xs
    | otherwise = evenList xs


oddList2 :: [Int] -> [Int]
oddList2 [] = []
oddList2 xs = filter odd xs


evenList2 :: [Int] -> [Int]
evenList2 [] = []
evenList2 xs = filter even xs