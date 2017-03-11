module RewriteUsingFold where

--recusrion using (&&)

myAnd :: [Bool] -> Bool
myAnd [] = True
myAnd (x : xs) = x && myAnd xs


--using foldr point free

myAnd' :: [Bool] -> Bool
myAnd' = foldr (&&) True


--1.myOr returns True if any Bool in the list is True

myOr :: [Bool] -> Bool
myOr = foldr (||) False

--2.myAny returns True if a -> Bool applied to any of the values in
--the list returns True

myAny :: (a -> Bool) -> [a] -> Bool
myAny f = foldr (\x y -> f x || y) False


--3.
myElem :: Eq a => a -> [a] -> Bool
myElem a = foldr (\x y -> x == a || y) False


--4.
myReverse :: [a] -> [a]
myReverse = foldr (\x y -> y ++ [x]) []


--5.
myMap :: (a -> b) -> [a] -> [b]
myMap f = foldr (\x y -> (f x) : y) []


--6
myFilter :: (a -> Bool) -> [a] -> [a]
myFilter f = foldr f' []
    where f' a b
            | f a = a : b
            | otherwise = b



--7
squish :: [[a]] -> [a]
squish = foldr (\x y -> x ++ y) []


--8
squishMap :: (a -> [b]) -> [a] -> [b]
squishMap f = foldr (\x y -> f x ++ y) []


--9
squishAgain :: [[a]] -> [a]
squishAgain = squishMap id


--10
myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy _ []     = undefined
myMaximumBy f (x : xs) = foldr f' x xs
    where
        f' a b = compareBy GT f a b



compareBy :: Ordering -> (a -> a -> Ordering) -> a -> a -> a
compareBy o f a b | f a b == o = a
                  | otherwise = b


--11
myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy _ [] = undefined
myMinimumBy f (x : xs) = foldr f' x xs
    where
        f' a b = compareBy LT f a b




