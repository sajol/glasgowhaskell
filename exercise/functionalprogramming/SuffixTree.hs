
import Data.List

--non-empty suffixes


-- with as pattern, xs inside the body is the value used while matching
-- memory efficient
suffixes_asPattern :: [a] -> [[a]]
suffixes_asPattern [] = []
suffixes_asPattern xs@(_:xs') = xs : suffixes_asPattern xs'


-- (x:xs) inside body is the copy of pattern (x:xs)
-- takes memory
suffixes_noAsPattern :: [a] -> [[a]]
suffixes_noAsPattern [] = []
suffixes_noAsPattern (x:xs) = (x:xs) : suffixes_noAsPattern xs


suffixes :: [a] -> [[a]]
suffixes [] = []
suffixes xs = init(tails xs)


compose :: (b -> c) -> (a -> b) -> a -> c
compose f g x = f (g x)


suffixes2 xs = compose init tails xs

suffixes3 = compose init tails

suffixes4 xs = (init . tails) xs

suffixes5 = init.tails


