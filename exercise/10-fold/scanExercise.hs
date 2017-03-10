module ScanExercise where

--scanl
scanl' :: (a -> b -> a) -> a -> [b] -> [a]
scanl' f q ls =
    q : (case ls of
              [] -> []
              x:xs -> scanl' f (f q x) xs)



fibs = 1 : scanl (+) 1 fibs

fibsN x = fibs !! x


--1.fibs function to only return the first 20 Fibonacci
--numbers.

fibs20 = take 20 fibs



--2.fibs to return the Fibonacci numbers that are less than 100

fibsLessThan100 = takeWhile (< 100)  fibs


--3.write the factorial function from Recursion as a scan

fac = scanl (*) 1 [1..]
