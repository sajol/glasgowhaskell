module Cipher where

import Data.Char


caesar :: String -> Int -> String
caesar [] _ = []
caesar (x : xs) n =
    case isAlpha x of
        True -> cyp (+) x n : caesar xs n
        _    -> x : caesar xs n



unCaesar :: String -> Int -> String
unCaesar [] _ = []
unCaesar (x : xs) n =
    case isAlpha x of
            True -> cyp (-) x n : unCaesar xs n
            _    -> x : unCaesar xs n



cyp :: (Int -> Int -> Int) -> Char -> Int -> Char
cyp f c n = chr (((f (ord c - base) n) `mod` 26) + base)
    where
        base | isUpper c = ord 'A'
             | otherwise = ord 'a'
