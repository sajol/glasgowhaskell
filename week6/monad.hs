
myHead :: [a] -> Maybe a
myHead [] = Nothing
myHead (x:xs) = Just x

myTail :: [a] -> Maybe [a]
myTail [] = Nothing
myTail (x:xs) = Just xs

--computation using explicit maybe

foo :: [a] -> Maybe a
foo xs =
    case myTail xs of
    Nothing -> Nothing
    Just a -> case myTail a of
              Nothing -> Nothing
              Just b -> myHead b


--computation using Maybe monad
bar :: [a] -> Maybe a
bar xs =
    myTail xs >>= \a ->
    myTail a  >>= \b ->
    myHead b

--compuptation using do notation
bardo :: [a] -> Maybe a
bardo xs = do
    a <- myTail xs
    b <- myTail a
    myHead b



