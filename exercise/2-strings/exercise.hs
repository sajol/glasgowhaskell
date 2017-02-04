module Exercise where

appendExclamation :: String -> String
appendExclamation s = s ++ "!"


take4th :: String -> String
take4th s = if length s < 5
            then ""
            else  [s !! 4]


thirdLetter :: String -> Char
thirdLetter x = x !! 3

letterIndex :: Int -> Char
letterIndex x = curryString !! x
                where
                    curryString = "Curry is awesome!"

--Input Curry is awesome! -- Output awesome is Curry
rvrs :: String -> String
rvrs x = concat [take 7 $ drop 9 x,
                 " ",
                 drop 6 $ take 8 x ,
                 " ",
                 take 5 x]