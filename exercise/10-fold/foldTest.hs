module FoldTest where

--recusrion
mySum :: [Integer] -> Integer
mySum [] = 0
mySum (x : xs) = x + mySum xs


myLength :: [a] -> Integer
myLength [] = 0
myLength (_ : xs) = 1 + myLength xs


myProduct :: [Integer] -> Integer
myProduct [] = 1
myProduct (x : xs) = x * product xs


myConcat :: [[a]] -> [a]
myConcat [] = []
myConcat (x : xs) = x ++ myConcat xs


myFoldr :: (a -> b -> b) -> b -> [a] -> b
myFoldr f acc [] = acc
myFoldr f acc (x : xs) = f x (myFoldr f acc xs)


myFoldl :: (b -> a -> b) -> b -> [a] -> b
myFoldl f acc [] = acc
myFoldl f acc (x : xs) = myFoldl f (f acc x) xs



--write a function to take the first three letters of
--each String value in a list of strings and concatenate that result into
--a final String.

take3FromEachAndCombine :: [String] -> String
take3FromEachAndCombine xs = foldr (\a b -> take 3 a ++ b) "" xs

