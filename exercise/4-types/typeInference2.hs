module TypeInference2 where

f x y = x + y + 3

--(++) :: [a] -> [a] -> [a]
myConcat x = x ++ " yo"
-- :t => myConcat :: [Char] -> [Char]


--(*) :: Num a => a -> a -> a
myMult x = (x / 3) * 5
-- :t => myMult :: Fractional a => a -> a


--take :: Int -> [a] -> [a]
myTake x = take x "hey you"
-- :t => myTake :: Int -> [Char]

--(>) :: Ord a => a -> a -> Bool

myCom x = x > (length [1..10])
-- : t => myCom :: Int -> Bool

--(<) :: Ord a => a -> a -> Bool
myAlph x = x < 'z'

-- :t => myAlph :: Char -> Bool

