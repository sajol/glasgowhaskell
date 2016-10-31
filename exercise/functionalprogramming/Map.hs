
import Data.Char

square :: [Int] -> [Int]
square [] = []
square (x:xs) = x*x : square xs

upperCase :: String -> String
upperCase [] = []
upperCase (x:xs) = toUpper x : upperCase xs

square2 xs  = map (\x -> x * x) xs

upperCase2 xs = map toUpper xs

myMap :: (a->b) -> [a] -> [b]
myMap f []      = []
myMap f (x:xs) = f x : myMap f xs

myFoldrMap :: (a->b) -> [a] -> [b]
myFoldrMap _ [] = []
myFoldrMap f xs = foldr (\element accumulator -> f element : accumulator) [] xs

square3 xs = myMap (\x->x*x) xs

upperCase3 xs = myMap toUpper xs


