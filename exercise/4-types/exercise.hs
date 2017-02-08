module Exeercise where

a = (* 9) 6

b = head [(0,"doge"),(1,"kitteh")]

c = head [(0 :: Integer ,"doge"),(1,"kitteh")]

d = if False then True else False

e = length [1, 2, 3, 4, 5]

f = (length [1, 2, 3, 4]) > (length "TACOCAT")


x = 5
y = x + 5
w = y * 10

z = 4 / y




g = "Julie"
h = " <3"
i = "Haskell"
j = g ++ h ++ i



--write type signature

functionG (x : _) = x
--functionG :: [a] -> a


functionH (a,b) = b
--functionH :: (t,t1) -> t1

functionC a b = if a > b then True else False
--functionC :: Ord a => a -> a -> Bool



