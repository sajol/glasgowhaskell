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