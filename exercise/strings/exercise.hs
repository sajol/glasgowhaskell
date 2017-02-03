module Exercise where

appendExclamation :: String -> String
appendExclamation s = s ++ "!"


take4th :: String -> String
take4th s = if length s < 5
            then ""
            else  [s !! 4]