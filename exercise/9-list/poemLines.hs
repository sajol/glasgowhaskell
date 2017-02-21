module PoemLines where

{-
Next, write a function that takes a string and returns a list of
strings, using newline separators to break up the string as in the
following
-}



firstSen = "Tyger Tyger, burning bright\n"
secondSen = "In the forests of the night\n"
thirdSen = "What immortal hand or eye\n"
fourthSen = "Could frame thy fearful symmetry?"
sentences = firstSen ++ secondSen
            ++ thirdSen ++ fourthSen


{-
Try writing a new function that parameterizes the character
you’re breaking the string argument on and rewrite myWords and
myLines using it.
-}

separate :: Char -> String -> [String]
separate c s =
    case takeWhile (/= c) dropInitialNewLine of
            [] -> []
            xs -> xs : myLines rest
            where
                dropInitialNewLine = dropWhile (== c) s
                rest = dropWhile (/= c) dropInitialNewLine


myLines :: String -> [String]
myLines s = separate '\n' s





shouldEqual =
  [ "Tyger Tyger, burning bright"
  , "In the forests of the night"
  , "What immortal hand or eye"
  , "Could frame thy fearful symmetry?"
  ]



main :: IO ()
main =
    print $ "Are they equal? "
        ++ show (myLines sentences == shouldEqual)