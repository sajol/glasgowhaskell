module StandardFunctions where

myAnd :: [Bool] -> Bool
myAnd [] = True
myAnd (x : xs) = if x == False then False else myAnd xs


myAnd' :: [Bool] -> Bool
myAnd' [] = True
myAnd' (x : xs) = x && myAnd' xs


myOr :: [Bool] -> Bool
myOr [] = False
myOr (x : xs) =
    case x == True of
        True -> True
        _    -> myOr xs


myAny :: (a -> Bool) -> [a] -> Bool
myAny _ [] = False
myAny f (x : xs) =
    case f x of
        True -> True
        _    -> myAny f xs


myElem :: Eq a => a -> [a] -> Bool
myElem _ [] = False
myElem n (x : xs)
    | x == n = True
    | otherwise = myElem n xs


myElem' :: Eq a => a -> [a] -> Bool
myElem' n xs = any (\x -> x == n) xs


myReverse :: [a] -> [a]
myReverse [] = []
myReverse xs = process xs []
    where
        process xs acc =
            case xs of
                []       -> acc
                (x : xs) -> process xs (x : acc)


--squish flattens a list into a list
squish :: [[a]] -> [a]
squish [] = []
squish (x : xs) = x ++ squish xs


--squishMap maps a function over a list and
--concatenates the results.
squishMap :: (a -> [b]) -> [a] -> [b]
squishMap _ [] = []
squishMap f xs = (concat . map f ) xs


squishAgain :: [[a]] -> [a]
squishAgain xs = squishMap id xs


myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy _ [] = undefined
myMaximumBy f (x : xs) = process xs x
    where
        process [] acc = acc
        process (x : xs) acc
            | f acc x == GT = process xs acc
            | otherwise = process xs x



myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy _ [] = undefined
myMinimumBy f (x : xs) = process xs x
    where
            process [] acc = acc
            process (x : xs) acc
                | f acc x == GT = process xs x
                | otherwise = process xs acc


myMaximum :: (Ord a) => [a] -> a
myMaximum xs = myMaximumBy compare xs


--it can be written in terms of lambda
myMinimum :: (Ord a) => [a] -> a
myMinimum xs = myMinimumBy (\x1 x2 -> compare x1 x2) xs