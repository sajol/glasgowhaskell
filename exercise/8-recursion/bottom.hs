module Bottom where

f :: Bool -> Int
f True = error "blah"
f False = 0


g :: Bool -> Int
g False = 0

--A total function is a function that handles all of it's inputs
--A partial function is one which doesn't handle all of it's inputs

f' :: Bool -> Maybe Int
f' False = Just 0
f' _ = Nothing