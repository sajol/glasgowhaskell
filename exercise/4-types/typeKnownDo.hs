module TypeKnownDo where

data Woot
data Blah

f :: Woot -> Blah
f = undefined

g :: (Woot,Blah) -> (Blah,Blah)
-- g = ???
g (w,b) = (b, f w)


f1 :: Int -> String
f1 = undefined

g1 :: String -> Char
g1 = undefined

h1 :: Int -> Char
-- h1 = ???
h1 i = g1 $ f1 i


data X
data Y
data Z


xz :: X -> Z
xz = undefined

yz :: Y -> Z
yz = undefined

xForm :: (X,Y) -> (Z,Z)
-- xForm = ???
xForm (x,y) = (xz x, yz y)






