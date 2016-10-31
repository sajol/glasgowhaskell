
import Data.Char
import Data.List

mySum :: [Int] -> Int
mySum [] = 0
mySum xs = mySumHelper 0 xs

mySumHelper :: Int -> [Int] -> Int
mySumHelper acc [] = acc
mySumHelper acc (x:xs) = mySumHelper (acc+x) xs

--"do something to every element of a list, updating an accumulator as we go, and returning the accumulator when we're done-real world haskell"

foldlSum :: [Int] -> Int
foldlSum [] = 0
foldlSum xs = foldl (\accumulator element -> accumulator + element) 0 xs


niceFoldlSum :: [Int] -> Int
niceFoldlSum [] = 0
niceFoldlSum xs = foldl (+) 0 xs

{-simulation of foldl
foldl:folds from the left of a list
foldl (+) 0 (1:2:3:[])
== foldl (0 + 1)        (2:3:[])
== foldl ((0+1)+2)      (3:[])
== foldl (((0+1)+2)+3)  ([])
==       ((0+1)+2)+3)
-}


foldrSum :: [Int] -> Int
foldrSum [] = 0
foldrSum xs = foldr (\accumulator element -> accumulator + element) 0 xs

niceFoldrSum :: [Int] -> Int
niceFoldrSum [] = 0
niceFoldrSum xs = foldr (+) 0 xs

{-simulation of foldr
foldr:folds from the right of a list
foldr (+) 0 (1:2:3:[])
== 1 +            foldr (+) 0 (2:3:[])
== 1 + (2 +       foldr (+) 0 (3:[]))
== 1 + (2 + (3 +  foldr (+) 0 []))
== 1 + (2 + (3 + 0))
-}


identity :: [a] -> [a]
identity [] = []
identity xs = foldr (:) [] xs


append :: [a] -> [a] -> [a]
append [] [] = []
append xs ys = foldr (:) ys xs


--Exercise

asInt :: String -> Int
asInt ('-':xs) = -asInt xs
asInt xs = foldl' (\accumulator elem -> ( digitToInt elem + accumulator * 10)) 0 xs

type ErrorMessage = String

allowedCharacters = ['0'..'9'] ++ ['-']

isElementOfAllowedCharacters :: Char -> Bool
isElementOfAllowedCharacters c = c `elem`allowedCharacters

anyElementContainsAllowedCharacters :: String -> Bool
anyElementContainsAllowedCharacters xs = any isElementOfAllowedCharacters xs

asInt_either :: String -> Either ErrorMessage Int
asInt_either xs
    | xs == "" = Left ("Empty")
    | anyElementContainsAllowedCharacters xs = Right (asInt xs)
    | otherwise = Left ("Non-digit '" ++ xs ++ "'")



concat' :: [[a]] -> [a]
concat' xs = foldr (++) [] xs

takeWhile_recur :: (a -> Bool) -> [a] -> [a]
takeWhile_recur function [] = []
takeWhile_recur function (x:xs)
    | function x = [x]
    | otherwise = []


takeWhile_foldr :: (a -> Bool) -> [a] -> [a]
takeWhile_foldr function xs = foldr takeWhile' [] xs
                              where
                                takeWhile' element accumulator
                                    | function element = element : accumulator
                                    | otherwise = []

