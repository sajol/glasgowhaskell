
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


myList :: [a] -> Maybe [a]
myList [] = Nothing
myList a = Just a

headOfMyList :: [a] -> Maybe a
headOfMyList [] = Nothing
headOfMyList (x:xs) = Just x

tailOfMyList :: [a] -> Maybe [a]
tailOfMyList [] = Nothing
tailOfMyList (x:xs) = Just xs


incrementBy :: Int -> Int -> Int
incrementBy n number = n + number

incrementListByOne :: [Int] -> Maybe [Int]
incrementListByOne [] = Nothing
incrementListByOne xs = Just (map (\number -> (incrementBy 1 number)) xs)


getHeadOfMyIncrementedList xs | xs == [] = Nothing
                              | otherwise = myList xs >>= incrementListByOne >>= headOfMyList


getTailOfMyIncrementedList xs | xs == [] = Nothing
                              | otherwise = myList xs >>= incrementListByOne >>= tailOfMyList

--getTailOfMyIncrementedList [1,2,3]             Just [3,4]
--getHeadOfMyIncrementedList [10,2,3,4,5]        Just 11