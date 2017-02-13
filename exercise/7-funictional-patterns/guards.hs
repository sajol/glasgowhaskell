module Guards where

myAbs :: Integer -> Integer
myAbs x
    | x < 0 = (-x)
    | otherwise = x


--test of sodium levels in the blood

bloodNa :: Integer -> String
bloodNa x
    | x < 135 = "too low"
    | x > 145 = "too high"
    | otherwise = "just right"


-- test if the triangle whose sides they measure is a right triangle or not
--(using the Pythagorean theorem)

isRight :: (Num a, Eq a) => a -> a -> a -> String
isRight a b c
    | a^2 + b^2 == c^2 = "RIGHT ON"
    | otherwise = "NOT RIGHT"


--how old is your dog in human years
dogYrs :: (Num a, Ord a) => a -> a
dogYrs x
    | x <= 0 = 0
    | x <= 1 = x * 15
    | x <= 2 = x * 12
    | x <= 4 = x * 8
    | otherwise = x * 6



avgGrade :: (Fractional a, Ord a) => a -> Char
avgGrade x
    | y >= 0.9   = 'A'
    | y >= 0.8   = 'B'
    | y >= 0.7   = 'C'
    | y >= 0.59  = 'D'
    | y <  0.59  = 'E'
    where y = x / 100



--intermission exercises
isPalindrome xs
    | xs == reverse xs = True
    | otherwise = False


numbers x
    | x <  0  = -1
    | x == 0  =  0
    | x >  0  =  1