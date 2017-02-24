module TransformListOfValues where

import Data.Bool
-- write a function that transforms string into a list of bool
--by checking whether each character is vowel

itIsMystery :: String -> [Bool]
itIsMystery xs = map (\x -> elem x "aeiou") xs

--write a function that will find 3 from list then negate it and return the new readList
myList :: [Integer] -> [Integer]
myList xs = map (\x -> if x == 3 then (-x) else (x)) xs

--rewrite myList and use bool function instead of if else
myList' :: [Integer] -> [Integer]
myList' xs = map (\x -> bool x (-x) (x == 3)) xs