module WordNumber where

import Data.List (intersperse)

digitToWord :: Int -> String
digitToWord n
    | n == 0 = "zero"
    | n == 1 = "one"
    | n == 2 = "two"
    | n == 3 = "three"
    | n == 4 = "four"
    | n == 5 = "five"
    | n == 6 = "six"
    | n == 7 = "seven"
    | n == 8 = "eight"
    | n == 9 = "nine"


digits :: Int -> [Int]
digits n = digitList n []
    where
        digitList n result
            | n <= 9 = n : result
            | otherwise = digitList (div n 10) ((mod n 10) : result)


wordNumber :: Int -> String
wordNumber n = (concat . intersperse "-" .map digitToWord . digits) n