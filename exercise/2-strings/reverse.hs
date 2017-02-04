module Reverse where

--Input Curry is awesome! -- Output awesome is Curry
rvrs :: String -> String
rvrs x = concat [take 7 $ drop 9 x,
                 " ",
                 drop 6 $ take 8 x ,
                 " ",
                 take 5 x]


main :: IO ()
main = print $ rvrs "Curry is awesome!"