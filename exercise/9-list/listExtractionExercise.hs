module ListExtractionExercise where

{-
1. Using takeWhile and dropWhile , write a function that takes a
string and returns a list of strings, using spaces to separate the
elements of the string into words
-}

myWords :: String -> [String]
myWords s =
    case takeWhile (/= ' ') dropWhiteSpace of
        [] -> []
        xs -> xs : myWords rest
        where
            dropWhiteSpace = dropWhile (== ' ') s
            rest = dropWhile (/= ' ') dropWhiteSpace
