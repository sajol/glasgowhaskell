module Recursion where

fourFactorial :: Integer
fourFactorial = 4 * 3 * 2 * 1

--it doesn't have base case. it will never terminate
brokenFact1 :: Integer -> Integer
brokenFact1 n = n * brokenFact1 (n - 1)


factorial :: Integer -> Integer
factorial 1 = 1
factorial n = n * factorial (n - 1)


incTimes :: (Eq a, Num a) => a -> a -> a
incTimes 0 n = n
incTimes times n = 1 + (incTimes (times - 1) n)

--abstract the recursion out of incTimes
applyTimes :: (Eq a, Num a) => a -> (a -> a) -> a -> a
applyTimes 0 f n = n
applyTimes times f n = f (applyTimes (times - 1) f n)

applyTimes' :: (Eq a, Num a) => a -> (a -> a) -> a -> a
applyTimes' times f n = (f . applyTimes (times - 1) f) n

incTimes' :: (Eq a, Num a) => a -> a -> a
incTimes' times n = applyTimes times (+1) n



fibonacci :: (Integral a) => a -> a
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci x = fibonacci (x - 1) + fibonacci (x - 2)



--divide in terms of subtraction
divideBy :: (Integral a) => a -> a -> (a,a)
divideBy numerator denominator =
    execute numerator denominator count
        where
            count = 0
            execute n d c
                | n < d = (c, n)
                | otherwise = execute (n - d) d (c + 1)


--fixing divided by

data DividedResult = Result Integer | DividedByZero deriving Show

dividedByImproved :: Integer -> Integer -> DividedResult
dividedByImproved numerator denominator
    | denominator == 0 = DividedByZero
    | otherwise = execute (abs numerator) (abs denominator) 0
    where
        execute n d c
            | n < d = Result (c * negativeFactor)
            | otherwise = execute (n - d) d (c + 1)
            where negativeFactor
                      | factor == 0 = 0
                      | factor > 0 = 1
                      | otherwise = -1
                      where
                        factor = numerator * denominator




