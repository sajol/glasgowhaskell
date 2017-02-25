module Exercise where

import Data.Char

--1.Query the types of isUpper and toUpper
--isUpper :: Char -> Bool
--toUpper :: Char -> Char

--2.write a function that filters all the uppercase
--letters out of a String
filterUpperCaseLetter :: String -> String
filterUpperCaseLetter s = filter (\x -> isUpper x) s


--3.Write a function that will capitalize the first letter of a String
--and return the entire String
cap :: String -> String
cap [] = ""
cap (x : xs) = toUpper x : xs


--4.Write a function that will capitalize all the letters of a String
--and return the entire String
capAll :: String -> String
capAll [] = ""
capAll (x : xs) = toUpper x : capAll xs


--5.write a function that will capitalize the first letter of a String
--and return only that letter as the result
capFirst :: String -> Char
capFirst xs = (toUpper . head) xs

capFirst' :: String -> Char
capFirst' = toUpper . head